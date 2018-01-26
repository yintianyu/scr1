//ytydla_conv_cmac_accu.sv

`include "ytydla_define.svh"

module ytydla_cmac_accu(ytydla_core_clk,
                             ytydla_core_rst_n,
                             cmac2accu_valid,
                             cmac2accu_adder_0,
                             cmac2accu_adder_1,
                             cmac2accu_adder_2,
                             cmac2accu_adder_3,
                             cmac2accu_adder_4,
                             cmac2accu_adder_5,
                             cmac2accu_adder_6,
                             cmac2accu_adder_7,
                             cmac2accu_adder_8,
                             cmac2accu_adder_9,
                             cmac2accu_adder_10,
                             cmac2accu_adder_11,
                             cmac2accu_adder_12,
                             cmac2accu_adder_13,
                             cmac2accu_adder_14,
                             cmac2accu_adder_15,
                             cmac2accu_adder_16,
                             cmac2accu_adder_17,
                             cmac2accu_adder_18,
                             cmac2accu_adder_19,
                             cmac2accu_adder_20,
                             cmac2accu_adder_21,
                             cmac2accu_adder_22,
                             cmac2accu_adder_23,
                             cmac2accu_adder_24,
                             cmac2accu_adder_25,
                             cmac2accu_adder_26,
                             cmac2accu_adder_27,
                             cmac2accu_adder_28,
                             cmac2accu_adder_29,
                             cmac2accu_adder_30,
                             cmac2accu_adder_31,
                             cmac2accu_adder_32,
                             cmac2accu_adder_33,
                             cmac2accu_adder_34,
                             cmac2accu_adder_35,
                             cmac2accu_adder_36,
                             cmac2accu_adder_37,
                             cmac2accu_adder_38,
                             cmac2accu_adder_39,
                             cmac2accu_adder_40,
                             cmac2accu_adder_41,
                             cmac2accu_adder_42,
                             cmac2accu_adder_43,
                             cmac2accu_adder_44,
                             cmac2accu_adder_45,
                             cmac2accu_adder_46,
                             cmac2accu_adder_47,
                             cmac2accu_adder_48,
                             cmac2accu_adder_49,
                             cmac2accu_adder_50,
                             cmac2accu_adder_51,
                             cmac2accu_adder_52,
                             cmac2accu_adder_53,
                             cmac2accu_adder_54,
                             cmac2accu_adder_55,
                             cmac2accu_adder_56,
                             cmac2accu_adder_57,
                             cmac2accu_adder_58,
                             cmac2accu_adder_59,
                             cmac2accu_adder_60,
                             cmac2accu_adder_61,
                             cmac2accu_adder_62,
                             cmac2accu_adder_63,
                             accu2cmac_aggregation,
                             accu2cmac_valid);
    input                               ytydla_core_clk;
    input                               ytydla_core_rst_n;
    input                               cmac2accu_valid;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_0;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_1;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_2;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_3;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_4;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_5;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_6;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_7;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_8;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_9;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_10;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_11;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_12;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_13;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_14;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_15;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_16;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_17;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_18;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_19;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_20;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_21;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_22;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_23;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_24;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_25;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_26;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_27;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_28;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_29;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_30;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_31;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_32;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_33;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_34;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_35;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_36;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_37;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_38;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_39;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_40;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_41;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_42;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_43;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_44;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_45;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_46;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_47;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_48;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_49;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_50;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_51;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_52;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_53;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_54;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_55;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_56;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_57;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_58;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_59;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_60;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_61;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_62;
    input    [`YTYDLA_DATA_LENGTH - 1:0] cmac2accu_adder_63;
    output   logic  [`YTYDLA_DATA_LENGTH - 1:0] accu2cmac_aggregation;
    output   logic                       accu2cmac_valid;


    cmac_accu_fsm_e                     cmac_accu_fsm;
    logic      [2:0]                    cal_time;


    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_0;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_1;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_2;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_3;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_4;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_5;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_6;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_7;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_8;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_9;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_10;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_11;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_12;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_13;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_14;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level1_15;

    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level2_0;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level2_1;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level2_2;
    logic   [`YTYDLA_DATA_LENGTH - 1:0] accu_level2_3;

    assign accu2cmac_valid = (cmac_accu_fsm == ACCU_FSM_VLD);

//-----------------------------
//  FSM
//-----------------------------
    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n) begin
            cmac_accu_fsm <= ACCU_FSM_IDLE;
        end else begin
            case (cmac_accu_fsm)
                ACCU_FSM_IDLE: 
                cmac_accu_fsm <= cmac2accu_valid ? ACCU_FSM_CAL : ACCU_FSM_IDLE;
                ACCU_FSM_CAL :
                if (cal_time >= 2) begin
                    cmac_accu_fsm <= ACCU_FSM_VLD;
                end
                else begin
                    cmac_accu_fsm <= ACCU_FSM_CAL;
                end
                ACCU_FSM_VLD:
                cmac_accu_fsm <= ACCU_FSM_IDLE;
            endcase
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n) begin
            cal_time <= 'b0;
        end
        else begin
            if (cmac_accu_fsm == ACCU_FSM_CAL)
                cal_time <= cal_time + 1;
            else
                cal_time <= 'b0; 
        end
    end

    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_0 <= cmac2accu_adder_3 + cmac2accu_adder_2 + cmac2accu_adder_1 + cmac2accu_adder_0;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_1 <= cmac2accu_adder_7 + cmac2accu_adder_6 + cmac2accu_adder_5 + cmac2accu_adder_4;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_2 <= cmac2accu_adder_11 + cmac2accu_adder_10 + cmac2accu_adder_9 + cmac2accu_adder_8;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_3 <= cmac2accu_adder_15 + cmac2accu_adder_14 + cmac2accu_adder_13 + cmac2accu_adder_12;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_4 <= cmac2accu_adder_19 + cmac2accu_adder_18 + cmac2accu_adder_17 + cmac2accu_adder_16;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_5 <= cmac2accu_adder_23 + cmac2accu_adder_22 + cmac2accu_adder_21 + cmac2accu_adder_20;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_6 <= cmac2accu_adder_27 + cmac2accu_adder_26 + cmac2accu_adder_25 + cmac2accu_adder_24;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_7 <= cmac2accu_adder_31 + cmac2accu_adder_30 + cmac2accu_adder_29 + cmac2accu_adder_28;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_8 <= cmac2accu_adder_35 + cmac2accu_adder_34 + cmac2accu_adder_33 + cmac2accu_adder_32;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_9 <= cmac2accu_adder_39 + cmac2accu_adder_38 + cmac2accu_adder_37 + cmac2accu_adder_36;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_10 <= cmac2accu_adder_43 + cmac2accu_adder_42 + cmac2accu_adder_41 + cmac2accu_adder_40;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_11 <= cmac2accu_adder_47 + cmac2accu_adder_46 + cmac2accu_adder_45 + cmac2accu_adder_44;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_12 <= cmac2accu_adder_51 + cmac2accu_adder_50 + cmac2accu_adder_49 + cmac2accu_adder_48;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_13 <= cmac2accu_adder_55 + cmac2accu_adder_54 + cmac2accu_adder_53 + cmac2accu_adder_52;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_14 <= cmac2accu_adder_59 + cmac2accu_adder_58 + cmac2accu_adder_57 + cmac2accu_adder_56;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level1_15 <= cmac2accu_adder_63 + cmac2accu_adder_62 + cmac2accu_adder_61 + cmac2accu_adder_60;
    end



    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level2_0 <= accu_level1_3 + accu_level1_2 + accu_level1_1 + accu_level1_0;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level2_1 <= accu_level1_7 + accu_level1_6 + accu_level1_5 + accu_level1_4;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level2_2 <= accu_level1_11 + accu_level1_10 + accu_level1_9 + accu_level1_8;
    end
    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu_level2_3 <= accu_level1_15 + accu_level1_14 + accu_level1_13 + accu_level1_12;
    end

    always_ff   @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        accu2cmac_aggregation <= accu_level2_0 + accu_level2_1 + accu_level2_2 + accu_level2_3;
    end

endmodule
