/// Copyright by Syntacore LLC © 2016, 2017. See LICENSE for details
/// @file       <scr1_memory_tb_axi.sv>
/// @brief      AXI memory testbench
///

module scr1_memory_tb_axi #(
    parameter SIZE   = 1*1024*1024,
    parameter N_IF   = 2,
    parameter W_ID   = 4,
    parameter W_ADR  = 32,
    parameter W_DATA = 32
)
(
    // System
    input   logic                          rst_n,
    input   logic                          clk,

`ifdef SCR1_RVY_EXT
    // Write address channel
    input  logic                           y_awvalid,
    input  logic            [W_ID-1:0]     y_awid,
    input  logic            [W_ADR-1:0]    y_awaddr,
    input  logic            [2:0]          y_awsize,
    input  logic            [7:0]          y_awlen,
    output logic                           y_awready,

    // Write data channel
    input  logic                           y_wvalid,
    input  logic [`YTYDLA_LSU_WIDTH-1:0]   y_wdata,
    input  logic            [W_DATA/8-1:0] y_wstrb,
    input  logic                           y_wlast,
    output logic                           y_wready,

    // Write response channel
    input  logic                           y_bready,
    output logic                           y_bvalid,
    output logic            [W_ID-1:0]     y_bid,
    output logic            [1:0]          y_bresp,

    // Read address channel
    input  logic                           y_arvalid,
    input  logic            [W_ID-1:0]     y_arid,
    input  logic            [W_ADR-1:0]    y_araddr,
    input  logic            [1:0]          y_arburst,
    input  logic            [2:0]          y_arsize,
    input  logic            [7:0]          y_arlen,
    output logic                           y_arready,

    // Read data channel
    input  logic                           y_rready,
    output logic                           y_rvalid,
    output logic            [W_ID-1:0]     y_rid,
    output logic [`YTYDLA_LSU_WIDTH-1:0]   y_rdata,
    output logic                           y_rlast,
    output logic            [1:0]          y_rresp,
`endif // SCR1_RVY_EXT

    // Write address channel
    input  logic [N_IF-1:0]                awvalid,
    input  logic [N_IF-1:0] [W_ID-1:0]     awid,
    input  logic [N_IF-1:0] [W_ADR-1:0]    awaddr,
    input  logic [N_IF-1:0] [2:0]          awsize,
    input  logic [N_IF-1:0] [7:0]          awlen,
    output logic [N_IF-1:0]                awready,

    // Write data channel
    input  logic [N_IF-1:0]                wvalid,
    input  logic [N_IF-1:0] [W_DATA-1:0]   wdata,
    input  logic [N_IF-1:0] [W_DATA/8-1:0] wstrb,
    input  logic [N_IF-1:0]                wlast,
    output logic [N_IF-1:0]                wready,

    // Write response channel
    input  logic [N_IF-1:0]                bready,
    output logic [N_IF-1:0]                bvalid,
    output logic [N_IF-1:0] [W_ID-1:0]     bid,
    output logic [N_IF-1:0] [1:0]          bresp,

    // Read address channel
    input  logic [N_IF-1:0]                arvalid,
    input  logic [N_IF-1:0] [W_ID-1:0]     arid,
    input  logic [N_IF-1:0] [W_ADR-1:0]    araddr,
    input  logic [N_IF-1:0] [1:0]          arburst,
    input  logic [N_IF-1:0] [2:0]          arsize,
    input  logic [N_IF-1:0] [7:0]          arlen,
    output logic [N_IF-1:0]                arready,

    // Read data channel
    input  logic [N_IF-1:0]                rready,
    output logic [N_IF-1:0]                rvalid,
    output logic [N_IF-1:0] [W_ID-1:0]     rid,
    output logic [N_IF-1:0] [W_DATA-1:0]   rdata,
    output logic [N_IF-1:0]                rlast,
    output logic [N_IF-1:0] [1:0]          rresp
);

//-------------------------------------------------------------------------------
// Local parameters
//-------------------------------------------------------------------------------
localparam [W_ADR-1:0]                       PRINT_ADDR   = 32'hF000_0000;

//-------------------------------------------------------------------------------
// Local signal declaration
//-------------------------------------------------------------------------------
logic  [7:0]                                 memory [0:SIZE-1];
logic  [N_IF-1:0] [W_ADR-1:0]                awaddr_hold;
logic  [N_IF-1:0] [2:0]                      awsize_hold;
string                                       stuff_file;
genvar                                       gi;
genvar                                       gj;

logic[80 * 8:1]							     filename_memory;

`ifdef SCR1_RVY_EXT
logic   [W_ADR-1:0]                          y_awaddr_hold;
logic   [2:0]                                y_awsize_hold;
`endif // SCR1_RVY_EXT

//-------------------------------------------------------------------------------
// Local functions
//-------------------------------------------------------------------------------
`ifdef SCR1_RVY_EXT
function automatic logic [`YTYDLA_LSU_WIDTH-1:0] mem_read_y (
    logic [W_ADR:0] adr,
    int             bytes_num,
    int             bytes_max
    );

    mem_read_y  = 'x;
//  $display("In mem_read_y:\n");
//  $display("adr = 0x%x\n", adr);
    

    for (int i = 0; i < bytes_num; ++i) begin
        mem_read_y[(i*8)+:8] = memory[adr + i];
//      $display("memory[0x%x] = 0x%x\n",adr + i, memory[adr + i]);
    end
endfunction : mem_read_y
`endif // SCR1_RVY_EXT

function automatic logic [W_DATA-1:0] mem_read (
    logic [W_ADR:0] adr,
    int             bytes_num,
    int             bytes_max
    );

    logic [W_ADR:0] byte_lane;

    mem_read  = 'x;
    byte_lane = 0;

    for(int i=0; i<$clog2(bytes_max); ++i) begin
        byte_lane[i] = adr[i];
    end

    for(int i=byte_lane; i<bytes_max & bytes_num!=0; ++i) begin
        mem_read[(i*8)+:8] = memory[adr];
        adr = adr+1'b1;
        bytes_num = bytes_num - 1'b1;
    end
endfunction : mem_read

function automatic void mem_write (
    logic [W_ADR-1:0]      adr,
    logic [W_DATA-1:0]     data,
    logic [(W_DATA/8)-1:0] bytes_en,
    int                    bytes_num,
    int                    bytes_max
    );

    logic[W_ADR:0]         byte_lane;

    byte_lane = 0;

    for(int i=0; i<$clog2(bytes_max); ++i) begin
        byte_lane[i] = adr[i];
    end

    for(int i=byte_lane; i<bytes_max & bytes_num!=0; ++i) begin
        if(bytes_en[i] & adr==PRINT_ADDR) begin
            $write("%c",data[(i*8)+:8]);
        end else if(bytes_en[i]) begin
            memory[adr] = data[(i*8)+:8];
        end
        adr       = adr+1'b1;
        bytes_num = bytes_num-1'b1;
    end
endfunction : mem_write

//-------------------------------------------------------------------------------
// Load file to mem
//-------------------------------------------------------------------------------

always @(negedge rst_n) begin
    filename_memory = "./data/memory.lists";
    memory = '{SIZE{'0}};
    if(stuff_file.len()>0) $readmemh(stuff_file,memory);
    $readmemh(filename_memory, memory);
end


// High Speed AXI
`ifdef SCR1_RVY_EXT
//-------------------------------------------------------------------------------
// Read operation
//-------------------------------------------------------------------------------
always @(posedge clk, negedge rst_n) begin
    if(~rst_n) begin
        y_arready <= 1'b1;
        y_rvalid  <= 1'b0;
        y_rresp   <= 2'd3;
        y_rdata   <= 'x;
        y_rlast   <= 1'b0;
        y_rid     <= '0;
    end else begin

        // Read data: acked
        if( y_rvalid & y_rready ) begin
            y_arready <= 1'b1;
            y_rvalid  <= 1'b0;
        end else if( y_rvalid & !y_rready ) begin
            y_arready <= 1'b0;
        end

        // Read data: valid
        if( y_arvalid & y_arready & ~(y_rvalid & !y_rready) ) begin

            y_rvalid <= 1'b1;
            y_rresp  <= '0;
            y_rlast  <= 1'b1;
            y_rid    <= y_arid;

            y_rdata  <= mem_read_y( y_araddr,
                                    4 * y_arsize,
                                    W_DATA/8 );
        end
    end
end

//-------------------------------------------------------------------------------
// Write operation
//-------------------------------------------------------------------------------
always @(posedge clk, negedge rst_n) begin
    if(~rst_n) begin
        y_bvalid  <= '0;
        y_bresp   <= 2'd3;
        y_awready <= 1'b1;
        y_wready  <= 1'b1;
    end else begin

        // Write data: response
        if( y_bvalid & y_bready ) begin
            y_bvalid  <= 1'b0;
            y_awready <= 1'b1;
            y_wready  <= 1'b1;
        end else if( y_bvalid & !y_bready ) begin
            y_awready <= 1'b0;
            y_wready  <= 1'b0;
        end

        // Write data: get address
        if( y_awvalid & y_awready & ~(y_bvalid & !y_bready) ) begin
            y_bid <= y_awid;
            if( ~y_wvalid ) begin
                y_awaddr_hold <= y_awaddr;
                y_awsize_hold <= y_awsize;
                y_awready <= 1'b0;
            end
        end

        // Write data: get data
        if( y_wvalid & y_wready & y_wlast ) begin
            y_bvalid <= 1'b1;
            y_bresp  <= '0;

//          mem_write( y_awready ? y_awaddr : y_awaddr_hold,
//                     y_wdata,
//                     y_wstrb,
//                     2**(y_awready ? y_awsize : y_awsize_hold),
//                     W_DATA/8 );
        end
    end
end
`endif // SCR1_RVY_EXT

generate for(gi=0; gi<N_IF; ++gi) begin : rw_if

//-------------------------------------------------------------------------------
// Read operation
//-------------------------------------------------------------------------------
always @(posedge clk, negedge rst_n) begin
    if(~rst_n) begin
        arready[gi] <= 1'b1;
        rvalid[gi]  <= 1'b0;
        rresp[gi]   <= 2'd3;
        rdata[gi]   <= 'x;
        rlast[gi]   <= 1'b0;
        rid[gi]     <= '0;
    end else begin

        // Read data: acked
        if( rvalid[gi] & rready[gi] ) begin
            arready[gi] <= 1'b1;
            rvalid[gi]  <= 1'b0;
        end else if( rvalid[gi] & !rready[gi] ) begin
            arready[gi] <= 1'b0;
        end

        // Read data: valid
        if( arvalid[gi] & arready[gi] & ~(rvalid[gi] & !rready[gi]) ) begin

            rvalid[gi] <= 1'b1;
            rresp[gi]  <= '0;
            rlast[gi]  <= 1'b1;
            rid[gi]    <= arid[gi];

            rdata[gi]  <= mem_read( araddr[gi],
                                    2**arsize[gi],
                                    W_DATA/8 );
        end
    end
end

//-------------------------------------------------------------------------------
// Write operation
//-------------------------------------------------------------------------------
always @(posedge clk, negedge rst_n) begin
    if(~rst_n) begin
        bvalid[gi]  <= '0;
        bresp[gi]   <= 2'd3;
        awready[gi] <= 1'b1;
        wready[gi]  <= 1'b1;
    end else begin

        // Write data: response
        if( bvalid[gi] & bready[gi] ) begin
            bvalid[gi]  <= 1'b0;
            awready[gi] <= 1'b1;
            wready[gi]  <= 1'b1;
        end else if( bvalid[gi] & !bready[gi] ) begin
            awready[gi] <= 1'b0;
            wready[gi]  <= 1'b0;
        end

        // Write data: get address
        if( awvalid[gi] & awready[gi] & ~(bvalid[gi] & !bready[gi]) ) begin
            bid <= awid[gi];
            if( ~wvalid[gi] ) begin
                awaddr_hold[gi] <= awaddr[gi];
                awsize_hold[gi] <= awsize[gi];
                awready[gi] <= 1'b0;
            end
        end

        // Write data: get data
        if( wvalid[gi] & wready[gi] & wlast[gi] ) begin
            bvalid[gi] <= 1'b1;
            bresp[gi]  <= '0;

            mem_write( awready[gi] ? awaddr[gi] : awaddr_hold[gi],
                       wdata[gi],
                       wstrb[gi],
                       2**(awready[gi] ? awsize[gi] : awsize_hold[gi]),
                       W_DATA/8 );
        end
    end
end

//-------------------------------------------------------------------------------
// Assertions
//-------------------------------------------------------------------------------
SVA_TBMEM_AWADDR_404 :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        awvalid[gi] |-> awaddr[gi]<SIZE | awaddr[gi]==PRINT_ADDR
    )
    else $error("TBMEM: awaddr[%0d] >= SIZE",gi);

SVA_TBMEM_X_AWVALID :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        !$isunknown(awvalid[gi])
    )
    else $error("TBMEM: X state on awvalid[%0d]",gi);

SVA_TBMEM_X_AWCHANNEL :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        awvalid[gi] |-> !$isunknown({awid[gi],awaddr[gi],awsize[gi],awlen[gi]})
    )
    else $error("TBMEM: X state on aw channel[%0d]",gi);

SVA_TBMEM_AWLEN :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        awvalid[gi] |-> awlen[gi]==0
    )
    else $error("TBMEM: awlen[%0d] = %0d is not supported",gi,awlen[gi]);

SVA_TBMEM_X_WVALID :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        !$isunknown(wvalid[gi])
    )
    else $error("TBMEM: X state on wvalid[%0d]",gi);

SVA_TBMEM_X_WCHANNEL :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        wvalid[gi] |-> !$isunknown({wstrb[gi],wlast[gi]})
    )
    else $error("TBMEM: X state on w channel[%0d]",gi);

for(gj=0; gj<W_DATA/8; ++gj) begin : SVA_TBMEM_X_WSTRB
WDATA :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        (wvalid[gi] & wstrb[gi][gj]) |-> !$isunknown(wdata[gi][(gj*8)+:8])
    )
    else $error("TBMEM: X state on wdata with wstrb[%0d][%0d]",gi,gj);
end

SVA_TBMEM_X_BREADY :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        bvalid[gi] |-> !$isunknown(bready[gi])
    )
    else $error("TBMEM: X state on bready[%0d]",gi);

SVA_TBMEM_ARADDR_404 :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        arvalid[gi] |-> araddr[gi]<SIZE | araddr[gi]==PRINT_ADDR
    )
    else $error("TBMEM: awaddr[%0d] >= SIZE",gi);

SVA_TBMEM_X_ARVALID :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        !$isunknown(arvalid[gi])
    )
    else $error("TBMEM: X state on arvalid[%0d]",gi);

SVA_TBMEM_X_ARCHANNEL :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        arvalid[gi] |-> !$isunknown({arid[gi],araddr[gi],arsize[gi],arlen[gi]})
    )
    else $error("TBMEM: X state on ar channel[%0d]",gi);

SVA_TBMEM_ARLEN :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        arvalid[gi] |-> arlen[gi]==0
    )
    else $error("TBMEM: arlen[%0d] = %0d is not supported",gi,arlen[gi]);

SVA_TBMEM_X_RREADY :
    assert property (
        @(negedge clk) disable iff (~rst_n)
        rvalid[gi] |-> !$isunknown(rready[gi])
    )
    else $error("TBMEM: X state on rready[%0d]",gi);

end endgenerate

endmodule : scr1_memory_tb_axi
