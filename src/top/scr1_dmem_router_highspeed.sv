
/// Copyright by Syntacore LLC © 2016, 2017. See LICENSE for details
/// @file       <scr1_dmem_router.sv>
/// @brief      Data memory router
///
`include "scr1_memif.svh"
`include "scr1_arch_description.svh"
`ifdef SCR1_RVY_EXT
`include "ytydla_define.svh"
`endif // SCR1_RVY_EXT

module scr1_dmem_router_highspeed
(
    // Control signals
    input   logic                           rst_n,
    input   logic                           clk,

    // Core interface
    output  logic                           dmem_req_ack,
    input   logic                           dmem_req,
    input   type_scr1_mem_cmd_e             dmem_cmd,
    input   type_scr1_mem_y_width_e         dmem_width,
    input   logic [`SCR1_DMEM_AWIDTH-1:0]   dmem_addr,
    input   logic [`YTYDLA_LSU_WIDTH-1:0]   dmem_wdata,
    output  logic [`YTYDLA_LSU_WIDTH-1:0]   dmem_rdata,
    output  type_scr1_mem_resp_e            dmem_resp,

    // PORT0 interface
    input   logic                           port0_req_ack,
    output  logic                           port0_req,
    output  type_scr1_mem_cmd_e             port0_cmd,
    output  type_scr1_mem_y_width_e         port0_width,
    output  logic [`SCR1_DMEM_AWIDTH-1:0]   port0_addr,
    output  logic [`YTYDLA_LSU_WIDTH-1:0]   port0_wdata,
    input   logic [`YTYDLA_LSU_WIDTH-1:0]   port0_rdata,
    input   type_scr1_mem_resp_e            port0_resp
);

//-------------------------------------------------------------------------------
// Local types declaration
//-------------------------------------------------------------------------------
typedef enum logic {
    SCR1_FSM_ADDR,
    SCR1_FSM_DATA
} type_scr1_fsm_e;

typedef enum logic [1:0] {
    SCR1_SEL_PORT0,
    SCR1_SEL_PORT1,
    SCR1_SEL_PORT2
} type_scr1_sel_e;

//-------------------------------------------------------------------------------
// Local signal declaration
//-------------------------------------------------------------------------------
type_scr1_fsm_e                 fsm;
type_scr1_sel_e                 port_sel;
type_scr1_sel_e                 port_sel_r;
logic [`YTYDLA_LSU_WIDTH-1:0]   sel_rdata;
type_scr1_mem_resp_e            sel_resp;
logic                           sel_req_ack;

//-------------------------------------------------------------------------------
// FSM
//-------------------------------------------------------------------------------
always_comb begin
    port_sel    = SCR1_SEL_PORT0;
end

always_ff @(negedge rst_n, posedge clk) begin
    if (~rst_n) begin
        fsm         <= SCR1_FSM_ADDR;
        port_sel_r  <= SCR1_SEL_PORT0;
    end else begin
        case (fsm)
            SCR1_FSM_ADDR : begin
                if (dmem_req & sel_req_ack) begin
                    fsm         <= SCR1_FSM_DATA;
                    port_sel_r  <= port_sel;
                end
            end
            SCR1_FSM_DATA : begin
                case (sel_resp)
                    SCR1_MEM_RESP_RDY_OK : begin
                        if (dmem_req & sel_req_ack) begin
                            fsm         <= SCR1_FSM_DATA;
                            port_sel_r  <= port_sel;
                        end else begin
                            fsm <= SCR1_FSM_ADDR;
                        end
                    end
                    SCR1_MEM_RESP_RDY_ER : begin
                        fsm <= SCR1_FSM_ADDR;
                    end
                    default : begin
                    end
                endcase
            end
            default : begin
            end
        endcase
    end
end

always_comb begin
    if ((fsm == SCR1_FSM_ADDR) | ((fsm == SCR1_FSM_DATA) & (sel_resp == SCR1_MEM_RESP_RDY_OK))) begin
        sel_req_ack   = port0_req_ack;
    end else begin
        sel_req_ack = 1'b0;
    end
end

always_comb begin
    sel_rdata   = port0_rdata;
    sel_resp    = port0_resp;
end

//-------------------------------------------------------------------------------
// Interface to core
//-------------------------------------------------------------------------------
assign dmem_req_ack = sel_req_ack;
assign dmem_rdata   = sel_rdata;
assign dmem_resp    = sel_resp;

//-------------------------------------------------------------------------------
// Interface to PORT0
//-------------------------------------------------------------------------------
always_comb begin
    port0_req = 1'b0;
    case (fsm)
        SCR1_FSM_ADDR : begin
            port0_req = dmem_req;
        end
        SCR1_FSM_DATA : begin
            if (sel_resp == SCR1_MEM_RESP_RDY_OK) begin
                port0_req = dmem_req;
            end
        end
        default : begin
        end
    endcase
end

assign port0_cmd    = dmem_cmd;
assign port0_width  = dmem_width;
assign port0_addr   = dmem_addr;
assign port0_wdata  = dmem_wdata;


`ifdef SCR1_SIM_ENV
//-------------------------------------------------------------------------------
// Assertion
//-------------------------------------------------------------------------------

SCR1_SVA_DMEM_RT_XCHECK : assert property (
    @(negedge clk) disable iff (~rst_n)
    dmem_req |-> !$isunknown({dmem_cmd, dmem_width})
    ) else $error("DMEM router Error: unknown values");

`endif // SCR1_SIM_ENV

endmodule : scr1_dmem_router_highspeed
