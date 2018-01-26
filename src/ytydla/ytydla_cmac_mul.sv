//lenet_conv_cmac_mul.sv

`include    "ytydla_define.svh"

//TODO: Use booth to calculate multiply instead of *
module ytydla_cmac_mul(
    clk,
    rst_n,
    data,
    weight,
    result);
    input               clk;
    input               rst_n;
    input   signed           [`YTYDLA_DATA_LENGTH - 1:0]   data;
    input   signed           [`YTYDLA_DATA_LENGTH - 1:0]   weight;
    output  signed           [`YTYDLA_DATA_LENGTH - 1:0]   result;

    logic   signed           [2 * `YTYDLA_DATA_LENGTH - 1:0] temp;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] pre_output;

    assign  temp = (data * weight) >> `YTYDLA_DATA_DOTPOT;
    assign  result = pre_output;
    always_ff @(posedge clk or negedge rst_n)begin
        if (~rst_n) begin
            pre_output <= `YTYDLA_DATA_LENGTH'b0;
        end
        else begin
            pre_output <= temp;
        end
    end
endmodule
