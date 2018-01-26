// ytydla_cmac.sv
`include "ytydla_define.svh"

module ytydla_cmac(ytydla_core_clk,
                        ytydla_core_rst_n,
                        mem2cmac_valid,
                        mem2cmac_dat_0,
                        mem2cmac_dat_1,
                        mem2cmac_dat_2,
                        mem2cmac_dat_3,
                        mem2cmac_dat_4,
                        mem2cmac_dat_5,
                        mem2cmac_dat_6,
                        mem2cmac_dat_7,
                        mem2cmac_dat_8,
                        mem2cmac_dat_9,
                        mem2cmac_dat_10,
                        mem2cmac_dat_11,
                        mem2cmac_dat_12,
                        mem2cmac_dat_13,
                        mem2cmac_dat_14,
                        mem2cmac_dat_15,
                        mem2cmac_dat_16,
                        mem2cmac_dat_17,
                        mem2cmac_dat_18,
                        mem2cmac_dat_19,
                        mem2cmac_dat_20,
                        mem2cmac_dat_21,
                        mem2cmac_dat_22,
                        mem2cmac_dat_23,
                        mem2cmac_dat_24,
                        mem2cmac_dat_25,
                        mem2cmac_dat_26,
                        mem2cmac_dat_27,
                        mem2cmac_dat_28,
                        mem2cmac_dat_29,
                        mem2cmac_dat_30,
                        mem2cmac_dat_31,
                        mem2cmac_dat_32,
                        mem2cmac_dat_33,
                        mem2cmac_dat_34,
                        mem2cmac_dat_35,
                        mem2cmac_dat_36,
                        mem2cmac_dat_37,
                        mem2cmac_dat_38,
                        mem2cmac_dat_39,
                        mem2cmac_dat_40,
                        mem2cmac_dat_41,
                        mem2cmac_dat_42,
                        mem2cmac_dat_43,
                        mem2cmac_dat_44,
                        mem2cmac_dat_45,
                        mem2cmac_dat_46,
                        mem2cmac_dat_47,
                        mem2cmac_dat_48,
                        mem2cmac_dat_49,
                        mem2cmac_dat_50,
                        mem2cmac_dat_51,
                        mem2cmac_dat_52,
                        mem2cmac_dat_53,
                        mem2cmac_dat_54,
                        mem2cmac_dat_55,
                        mem2cmac_dat_56,
                        mem2cmac_dat_57,
                        mem2cmac_dat_58,
                        mem2cmac_dat_59,
                        mem2cmac_dat_60,
                        mem2cmac_dat_61,
                        mem2cmac_dat_62,
                        mem2cmac_dat_63,
                        mem2cmac_dat_size,
                        mem2cmac_wt_0,
                        mem2cmac_wt_1,
                        mem2cmac_wt_2,
                        mem2cmac_wt_3,
                        mem2cmac_wt_4,
                        mem2cmac_wt_5,
                        mem2cmac_wt_6,
                        mem2cmac_wt_7,
                        mem2cmac_wt_8,
                        mem2cmac_wt_9,
                        mem2cmac_wt_10,
                        mem2cmac_wt_11,
                        mem2cmac_wt_12,
                        mem2cmac_wt_13,
                        mem2cmac_wt_14,
                        mem2cmac_wt_15,
                        mem2cmac_wt_16,
                        mem2cmac_wt_17,
                        mem2cmac_wt_18,
                        mem2cmac_wt_19,
                        mem2cmac_wt_20,
                        mem2cmac_wt_21,
                        mem2cmac_wt_22,
                        mem2cmac_wt_23,
                        mem2cmac_wt_24,
                        mem2cmac_wt_25,
                        mem2cmac_wt_26,
                        mem2cmac_wt_27,
                        mem2cmac_wt_28,
                        mem2cmac_wt_29,
                        mem2cmac_wt_30,
                        mem2cmac_wt_31,
                        mem2cmac_wt_32,
                        mem2cmac_wt_33,
                        mem2cmac_wt_34,
                        mem2cmac_wt_35,
                        mem2cmac_wt_36,
                        mem2cmac_wt_37,
                        mem2cmac_wt_38,
                        mem2cmac_wt_39,
                        mem2cmac_wt_40,
                        mem2cmac_wt_41,
                        mem2cmac_wt_42,
                        mem2cmac_wt_43,
                        mem2cmac_wt_44,
                        mem2cmac_wt_45,
                        mem2cmac_wt_46,
                        mem2cmac_wt_47,
                        mem2cmac_wt_48,
                        mem2cmac_wt_49,
                        mem2cmac_wt_50,
                        mem2cmac_wt_51,
                        mem2cmac_wt_52,
                        mem2cmac_wt_53,
                        mem2cmac_wt_54,
                        mem2cmac_wt_55,
                        mem2cmac_wt_56,
                        mem2cmac_wt_57,
                        mem2cmac_wt_58,
                        mem2cmac_wt_59,
                        mem2cmac_wt_60,
                        mem2cmac_wt_61,
                        mem2cmac_wt_62,
                        mem2cmac_wt_63,
                        cmac2mem_result,
                        cmac2mem_valid);
    input                                    ytydla_core_clk;
    input                                    ytydla_core_rst_n;
    input                                    mem2cmac_valid;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_0;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_1;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_2;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_3;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_4;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_5;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_6;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_7;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_8;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_9;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_10;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_11;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_12;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_13;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_14;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_15;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_16;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_17;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_18;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_19;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_20;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_21;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_22;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_23;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_24;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_25;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_26;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_27;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_28;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_29;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_30;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_31;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_32;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_33;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_34;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_35;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_36;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_37;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_38;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_39;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_40;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_41;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_42;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_43;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_44;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_45;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_46;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_47;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_48;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_49;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_50;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_51;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_52;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_53;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_54;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_55;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_56;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_57;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_58;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_59;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_60;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_61;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_62;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_dat_63;
    input       [31:0]                       mem2cmac_dat_size;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_0;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_1;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_2;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_3;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_4;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_5;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_6;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_7;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_8;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_9;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_10;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_11;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_12;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_13;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_14;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_15;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_16;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_17;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_18;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_19;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_20;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_21;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_22;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_23;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_24;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_25;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_26;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_27;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_28;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_29;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_30;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_31;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_32;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_33;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_34;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_35;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_36;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_37;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_38;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_39;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_40;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_41;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_42;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_43;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_44;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_45;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_46;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_47;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_48;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_49;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_50;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_51;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_52;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_53;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_54;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_55;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_56;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_57;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_58;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_59;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_60;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_61;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_62;
    input       [`YTYDLA_DATA_LENGTH - 1:0]  mem2cmac_wt_63;


    output  logic  [`YTYDLA_DATA_LENGTH - 1:0]  cmac2mem_result;
    output  logic                               cmac2mem_valid;

    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_0;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_1;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_2;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_3;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_4;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_5;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_6;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_7;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_8;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_9;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_10;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_11;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_12;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_13;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_14;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_15;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_16;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_17;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_18;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_19;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_20;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_21;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_22;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_23;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_24;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_25;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_26;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_27;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_28;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_29;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_30;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_31;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_32;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_33;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_34;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_35;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_36;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_37;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_38;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_39;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_40;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_41;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_42;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_43;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_44;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_45;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_46;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_47;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_48;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_49;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_50;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_51;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_52;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_53;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_54;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_55;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_56;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_57;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_58;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_59;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_60;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_61;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_62;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_dat_63;

    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_0;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_1;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_2;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_3;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_4;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_5;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_6;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_7;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_8;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_9;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_10;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_11;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_12;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_13;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_14;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_15;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_16;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_17;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_18;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_19;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_20;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_21;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_22;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_23;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_24;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_25;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_26;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_27;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_28;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_29;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_30;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_31;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_32;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_33;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_34;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_35;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_36;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_37;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_38;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_39;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_40;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_41;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_42;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_43;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_44;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_45;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_46;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_47;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_48;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_49;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_50;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_51;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_52;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_53;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_54;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_55;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_56;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_57;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_58;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_59;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_60;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_61;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_62;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  cmac_wt_63;

    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_0;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_1;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_2;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_3;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_4;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_5;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_6;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_7;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_8;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_9;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_10;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_11;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_12;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_13;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_14;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_15;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_16;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_17;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_18;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_19;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_20;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_21;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_22;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_23;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_24;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_25;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_26;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_27;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_28;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_29;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_30;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_31;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_32;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_33;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_34;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_35;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_36;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_37;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_38;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_39;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_40;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_41;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_42;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_43;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_44;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_45;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_46;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_47;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_48;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_49;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_50;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_51;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_52;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_53;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_54;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_55;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_56;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_57;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_58;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_59;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_60;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_61;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_62;
    logic         [`YTYDLA_DATA_LENGTH - 1:0]  mul_result_63;


    logic                                      input_valid_d1;      //Input valid signal laten one cycle
    logic                                      cmac2accu_valid;
    logic                                      accu2cmac_valid;

    assign cmac2mem_valid = accu2cmac_valid;

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n) begin
            input_valid_d1 <= 0;
        end
        else begin
            input_valid_d1 <= mem2cmac_valid;
        end
    end
    
    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n) begin
            cmac2accu_valid <= 0;
        end
        else begin
            cmac2accu_valid <= input_valid_d1;
        end
    end


    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_0 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 0) begin
                cmac_dat_0 <= mem2cmac_dat_0;
            end
            else begin
                cmac_dat_0 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_1 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 1) begin
                cmac_dat_1 <= mem2cmac_dat_1;
            end
            else begin
                cmac_dat_1 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_2 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 2) begin
                cmac_dat_2 <= mem2cmac_dat_2;
            end
            else begin
                cmac_dat_2 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_3 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 3) begin
                cmac_dat_3 <= mem2cmac_dat_3;
            end
            else begin
                cmac_dat_3 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_4 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 4) begin
                cmac_dat_4 <= mem2cmac_dat_4;
            end
            else begin
                cmac_dat_4 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_5 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 5) begin
                cmac_dat_5 <= mem2cmac_dat_5;
            end
            else begin
                cmac_dat_5 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_6 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 6) begin
                cmac_dat_6 <= mem2cmac_dat_6;
            end
            else begin
                cmac_dat_6 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_7 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 7) begin
                cmac_dat_7 <= mem2cmac_dat_7;
            end
            else begin
                cmac_dat_7 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_8 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 8) begin
                cmac_dat_8 <= mem2cmac_dat_8;
            end
            else begin
                cmac_dat_8 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_9 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 9) begin
                cmac_dat_9 <= mem2cmac_dat_9;
            end
            else begin
                cmac_dat_9 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_10 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 10) begin
                cmac_dat_10 <= mem2cmac_dat_10;
            end
            else begin
                cmac_dat_10 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_11 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 11) begin
                cmac_dat_11 <= mem2cmac_dat_11;
            end
            else begin
                cmac_dat_11 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_12 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 12) begin
                cmac_dat_12 <= mem2cmac_dat_12;
            end
            else begin
                cmac_dat_12 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_13 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 13) begin
                cmac_dat_13 <= mem2cmac_dat_13;
            end
            else begin
                cmac_dat_13 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_14 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 14) begin
                cmac_dat_14 <= mem2cmac_dat_14;
            end
            else begin
                cmac_dat_14 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_15 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 15) begin
                cmac_dat_15 <= mem2cmac_dat_15;
            end
            else begin
                cmac_dat_15 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_16 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 16) begin
                cmac_dat_16 <= mem2cmac_dat_16;
            end
            else begin
                cmac_dat_16 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_17 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 17) begin
                cmac_dat_17 <= mem2cmac_dat_17;
            end
            else begin
                cmac_dat_17 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_18 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 18) begin
                cmac_dat_18 <= mem2cmac_dat_18;
            end
            else begin
                cmac_dat_18 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_19 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 19) begin
                cmac_dat_19 <= mem2cmac_dat_19;
            end
            else begin
                cmac_dat_19 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_20 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 20) begin
                cmac_dat_20 <= mem2cmac_dat_20;
            end
            else begin
                cmac_dat_20 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_21 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 21) begin
                cmac_dat_21 <= mem2cmac_dat_21;
            end
            else begin
                cmac_dat_21 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_22 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 22) begin
                cmac_dat_22 <= mem2cmac_dat_22;
            end
            else begin
                cmac_dat_22 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_23 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 23) begin
                cmac_dat_23 <= mem2cmac_dat_23;
            end
            else begin
                cmac_dat_23 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_24 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 24) begin
                cmac_dat_24 <= mem2cmac_dat_24;
            end
            else begin
                cmac_dat_24 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_25 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 25) begin
                cmac_dat_25 <= mem2cmac_dat_25;
            end
            else begin
                cmac_dat_25 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_26 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 26) begin
                cmac_dat_26 <= mem2cmac_dat_26;
            end
            else begin
                cmac_dat_26 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_27 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 27) begin
                cmac_dat_27 <= mem2cmac_dat_27;
            end
            else begin
                cmac_dat_27 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_28 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 28) begin
                cmac_dat_28 <= mem2cmac_dat_28;
            end
            else begin
                cmac_dat_28 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_29 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 29) begin
                cmac_dat_29 <= mem2cmac_dat_29;
            end
            else begin
                cmac_dat_29 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_30 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 30) begin
                cmac_dat_30 <= mem2cmac_dat_30;
            end
            else begin
                cmac_dat_30 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_31 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 31) begin
                cmac_dat_31 <= mem2cmac_dat_31;
            end
            else begin
                cmac_dat_31 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_32 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 32) begin
                cmac_dat_32 <= mem2cmac_dat_32;
            end
            else begin
                cmac_dat_32 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_33 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 33) begin
                cmac_dat_33 <= mem2cmac_dat_33;
            end
            else begin
                cmac_dat_33 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_34 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 34) begin
                cmac_dat_34 <= mem2cmac_dat_34;
            end
            else begin
                cmac_dat_34 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_35 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 35) begin
                cmac_dat_35 <= mem2cmac_dat_35;
            end
            else begin
                cmac_dat_35 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_36 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 36) begin
                cmac_dat_36 <= mem2cmac_dat_36;
            end
            else begin
                cmac_dat_36 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_37 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 37) begin
                cmac_dat_37 <= mem2cmac_dat_37;
            end
            else begin
                cmac_dat_37 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_38 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 38) begin
                cmac_dat_38 <= mem2cmac_dat_38;
            end
            else begin
                cmac_dat_38 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_39 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 39) begin
                cmac_dat_39 <= mem2cmac_dat_39;
            end
            else begin
                cmac_dat_39 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_40 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 40) begin
                cmac_dat_40 <= mem2cmac_dat_40;
            end
            else begin
                cmac_dat_40 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_41 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 41) begin
                cmac_dat_41 <= mem2cmac_dat_41;
            end
            else begin
                cmac_dat_41 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_42 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 42) begin
                cmac_dat_42 <= mem2cmac_dat_42;
            end
            else begin
                cmac_dat_42 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_43 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 43) begin
                cmac_dat_43 <= mem2cmac_dat_43;
            end
            else begin
                cmac_dat_43 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_44 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 44) begin
                cmac_dat_44 <= mem2cmac_dat_44;
            end
            else begin
                cmac_dat_44 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_45 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 45) begin
                cmac_dat_45 <= mem2cmac_dat_45;
            end
            else begin
                cmac_dat_45 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_46 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 46) begin
                cmac_dat_46 <= mem2cmac_dat_46;
            end
            else begin
                cmac_dat_46 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_47 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 47) begin
                cmac_dat_47 <= mem2cmac_dat_47;
            end
            else begin
                cmac_dat_47 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_48 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 48) begin
                cmac_dat_48 <= mem2cmac_dat_48;
            end
            else begin
                cmac_dat_48 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_49 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 49) begin
                cmac_dat_49 <= mem2cmac_dat_49;
            end
            else begin
                cmac_dat_49 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_50 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 50) begin
                cmac_dat_50 <= mem2cmac_dat_50;
            end
            else begin
                cmac_dat_50 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_51 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 51) begin
                cmac_dat_51 <= mem2cmac_dat_51;
            end
            else begin
                cmac_dat_51 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_52 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 52) begin
                cmac_dat_52 <= mem2cmac_dat_52;
            end
            else begin
                cmac_dat_52 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_53 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 53) begin
                cmac_dat_53 <= mem2cmac_dat_53;
            end
            else begin
                cmac_dat_53 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_54 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 54) begin
                cmac_dat_54 <= mem2cmac_dat_54;
            end
            else begin
                cmac_dat_54 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_55 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 55) begin
                cmac_dat_55 <= mem2cmac_dat_55;
            end
            else begin
                cmac_dat_55 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_56 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 56) begin
                cmac_dat_56 <= mem2cmac_dat_56;
            end
            else begin
                cmac_dat_56 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_57 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 57) begin
                cmac_dat_57 <= mem2cmac_dat_57;
            end
            else begin
                cmac_dat_57 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_58 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 58) begin
                cmac_dat_58 <= mem2cmac_dat_58;
            end
            else begin
                cmac_dat_58 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_59 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 59) begin
                cmac_dat_59 <= mem2cmac_dat_59;
            end
            else begin
                cmac_dat_59 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_60 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 60) begin
                cmac_dat_60 <= mem2cmac_dat_60;
            end
            else begin
                cmac_dat_60 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_61 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 61) begin
                cmac_dat_61 <= mem2cmac_dat_61;
            end
            else begin
                cmac_dat_61 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_62 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 62) begin
                cmac_dat_62 <= mem2cmac_dat_62;
            end
            else begin
                cmac_dat_62 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_dat_63 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 63) begin
                cmac_dat_63 <= mem2cmac_dat_63;
            end
            else begin
                cmac_dat_63 <= 0;
            end
        end
    end

//TODO: always_ff to save the input weight


    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_0 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 0) begin
                cmac_wt_0 <= mem2cmac_wt_0;
            end
            else begin
                cmac_wt_0 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_1 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 1) begin
                cmac_wt_1 <= mem2cmac_wt_1;
            end
            else begin
                cmac_wt_1 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_2 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 2) begin
                cmac_wt_2 <= mem2cmac_wt_2;
            end
            else begin
                cmac_wt_2 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_3 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 3) begin
                cmac_wt_3 <= mem2cmac_wt_3;
            end
            else begin
                cmac_wt_3 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_4 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 4) begin
                cmac_wt_4 <= mem2cmac_wt_4;
            end
            else begin
                cmac_wt_4 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_5 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 5) begin
                cmac_wt_5 <= mem2cmac_wt_5;
            end
            else begin
                cmac_wt_5 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_6 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 6) begin
                cmac_wt_6 <= mem2cmac_wt_6;
            end
            else begin
                cmac_wt_6 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_7 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 7) begin
                cmac_wt_7 <= mem2cmac_wt_7;
            end
            else begin
                cmac_wt_7 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_8 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 8) begin
                cmac_wt_8 <= mem2cmac_wt_8;
            end
            else begin
                cmac_wt_8 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_9 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 9) begin
                cmac_wt_9 <= mem2cmac_wt_9;
            end
            else begin
                cmac_wt_9 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_10 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 10) begin
                cmac_wt_10 <= mem2cmac_wt_10;
            end
            else begin
                cmac_wt_10 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_11 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 11) begin
                cmac_wt_11 <= mem2cmac_wt_11;
            end
            else begin
                cmac_wt_11 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_12 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 12) begin
                cmac_wt_12 <= mem2cmac_wt_12;
            end
            else begin
                cmac_wt_12 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_13 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 13) begin
                cmac_wt_13 <= mem2cmac_wt_13;
            end
            else begin
                cmac_wt_13 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_14 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 14) begin
                cmac_wt_14 <= mem2cmac_wt_14;
            end
            else begin
                cmac_wt_14 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_15 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 15) begin
                cmac_wt_15 <= mem2cmac_wt_15;
            end
            else begin
                cmac_wt_15 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_16 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 16) begin
                cmac_wt_16 <= mem2cmac_wt_16;
            end
            else begin
                cmac_wt_16 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_17 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 17) begin
                cmac_wt_17 <= mem2cmac_wt_17;
            end
            else begin
                cmac_wt_17 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_18 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 18) begin
                cmac_wt_18 <= mem2cmac_wt_18;
            end
            else begin
                cmac_wt_18 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_19 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 19) begin
                cmac_wt_19 <= mem2cmac_wt_19;
            end
            else begin
                cmac_wt_19 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_20 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 20) begin
                cmac_wt_20 <= mem2cmac_wt_20;
            end
            else begin
                cmac_wt_20 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_21 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 21) begin
                cmac_wt_21 <= mem2cmac_wt_21;
            end
            else begin
                cmac_wt_21 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_22 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 22) begin
                cmac_wt_22 <= mem2cmac_wt_22;
            end
            else begin
                cmac_wt_22 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_23 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 23) begin
                cmac_wt_23 <= mem2cmac_wt_23;
            end
            else begin
                cmac_wt_23 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_24 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 24) begin
                cmac_wt_24 <= mem2cmac_wt_24;
            end
            else begin
                cmac_wt_24 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_25 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 25) begin
                cmac_wt_25 <= mem2cmac_wt_25;
            end
            else begin
                cmac_wt_25 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_26 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 26) begin
                cmac_wt_26 <= mem2cmac_wt_26;
            end
            else begin
                cmac_wt_26 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_27 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 27) begin
                cmac_wt_27 <= mem2cmac_wt_27;
            end
            else begin
                cmac_wt_27 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_28 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 28) begin
                cmac_wt_28 <= mem2cmac_wt_28;
            end
            else begin
                cmac_wt_28 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_29 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 29) begin
                cmac_wt_29 <= mem2cmac_wt_29;
            end
            else begin
                cmac_wt_29 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_30 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 30) begin
                cmac_wt_30 <= mem2cmac_wt_30;
            end
            else begin
                cmac_wt_30 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_31 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 31) begin
                cmac_wt_31 <= mem2cmac_wt_31;
            end
            else begin
                cmac_wt_31 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_32 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 32) begin
                cmac_wt_32 <= mem2cmac_wt_32;
            end
            else begin
                cmac_wt_32 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_33 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 33) begin
                cmac_wt_33 <= mem2cmac_wt_33;
            end
            else begin
                cmac_wt_33 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_34 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 34) begin
                cmac_wt_34 <= mem2cmac_wt_34;
            end
            else begin
                cmac_wt_34 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_35 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 35) begin
                cmac_wt_35 <= mem2cmac_wt_35;
            end
            else begin
                cmac_wt_35 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_36 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 36) begin
                cmac_wt_36 <= mem2cmac_wt_36;
            end
            else begin
                cmac_wt_36 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_37 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 37) begin
                cmac_wt_37 <= mem2cmac_wt_37;
            end
            else begin
                cmac_wt_37 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_38 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 38) begin
                cmac_wt_38 <= mem2cmac_wt_38;
            end
            else begin
                cmac_wt_38 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_39 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 39) begin
                cmac_wt_39 <= mem2cmac_wt_39;
            end
            else begin
                cmac_wt_39 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_40 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 40) begin
                cmac_wt_40 <= mem2cmac_wt_40;
            end
            else begin
                cmac_wt_40 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_41 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 41) begin
                cmac_wt_41 <= mem2cmac_wt_41;
            end
            else begin
                cmac_wt_41 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_42 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 42) begin
                cmac_wt_42 <= mem2cmac_wt_42;
            end
            else begin
                cmac_wt_42 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_43 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 43) begin
                cmac_wt_43 <= mem2cmac_wt_43;
            end
            else begin
                cmac_wt_43 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_44 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 44) begin
                cmac_wt_44 <= mem2cmac_wt_44;
            end
            else begin
                cmac_wt_44 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_45 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 45) begin
                cmac_wt_45 <= mem2cmac_wt_45;
            end
            else begin
                cmac_wt_45 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_46 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 46) begin
                cmac_wt_46 <= mem2cmac_wt_46;
            end
            else begin
                cmac_wt_46 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_47 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 47) begin
                cmac_wt_47 <= mem2cmac_wt_47;
            end
            else begin
                cmac_wt_47 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_48 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 48) begin
                cmac_wt_48 <= mem2cmac_wt_48;
            end
            else begin
                cmac_wt_48 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_49 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 49) begin
                cmac_wt_49 <= mem2cmac_wt_49;
            end
            else begin
                cmac_wt_49 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_50 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 50) begin
                cmac_wt_50 <= mem2cmac_wt_50;
            end
            else begin
                cmac_wt_50 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_51 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 51) begin
                cmac_wt_51 <= mem2cmac_wt_51;
            end
            else begin
                cmac_wt_51 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_52 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 52) begin
                cmac_wt_52 <= mem2cmac_wt_52;
            end
            else begin
                cmac_wt_52 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_53 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 53) begin
                cmac_wt_53 <= mem2cmac_wt_53;
            end
            else begin
                cmac_wt_53 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_54 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 54) begin
                cmac_wt_54 <= mem2cmac_wt_54;
            end
            else begin
                cmac_wt_54 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_55 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 55) begin
                cmac_wt_55 <= mem2cmac_wt_55;
            end
            else begin
                cmac_wt_55 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_56 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 56) begin
                cmac_wt_56 <= mem2cmac_wt_56;
            end
            else begin
                cmac_wt_56 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_57 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 57) begin
                cmac_wt_57 <= mem2cmac_wt_57;
            end
            else begin
                cmac_wt_57 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_58 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 58) begin
                cmac_wt_58 <= mem2cmac_wt_58;
            end
            else begin
                cmac_wt_58 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_59 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 59) begin
                cmac_wt_59 <= mem2cmac_wt_59;
            end
            else begin
                cmac_wt_59 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_60 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 60) begin
                cmac_wt_60 <= mem2cmac_wt_60;
            end
            else begin
                cmac_wt_60 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_61 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 61) begin
                cmac_wt_61 <= mem2cmac_wt_61;
            end
            else begin
                cmac_wt_61 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_62 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 62) begin
                cmac_wt_62 <= mem2cmac_wt_62;
            end
            else begin
                cmac_wt_62 <= 0;
            end
        end
    end

    always_ff @(posedge ytydla_core_clk or negedge ytydla_core_rst_n) begin
        if (~ytydla_core_rst_n)begin
            cmac_wt_63 <= 0;
        end
        else begin
            if(mem2cmac_dat_size > 63) begin
                cmac_wt_63 <= mem2cmac_wt_63;
            end
            else begin
                cmac_wt_63 <= 0;
            end
        end
    end

    ytydla_cmac_mul mul_0(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_0),
                          .weight   (cmac_wt_0),
                          .result   (mul_result_0));

    ytydla_cmac_mul mul_1(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_1),
                          .weight   (cmac_wt_1),
                          .result   (mul_result_1));

    ytydla_cmac_mul mul_2(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_2),
                          .weight   (cmac_wt_2),
                          .result   (mul_result_2));

    ytydla_cmac_mul mul_3(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_3),
                          .weight   (cmac_wt_3),
                          .result   (mul_result_3));

    ytydla_cmac_mul mul_4(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_4),
                          .weight   (cmac_wt_4),
                          .result   (mul_result_4));

    ytydla_cmac_mul mul_5(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_5),
                          .weight   (cmac_wt_5),
                          .result   (mul_result_5));

    ytydla_cmac_mul mul_6(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_6),
                          .weight   (cmac_wt_6),
                          .result   (mul_result_6));

    ytydla_cmac_mul mul_7(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_7),
                          .weight   (cmac_wt_7),
                          .result   (mul_result_7));

    ytydla_cmac_mul mul_8(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_8),
                          .weight   (cmac_wt_8),
                          .result   (mul_result_8));

    ytydla_cmac_mul mul_9(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_9),
                          .weight   (cmac_wt_9),
                          .result   (mul_result_9));

    ytydla_cmac_mul mul_10(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_10),
                          .weight   (cmac_wt_10),
                          .result   (mul_result_10));

    ytydla_cmac_mul mul_11(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_11),
                          .weight   (cmac_wt_11),
                          .result   (mul_result_11));

    ytydla_cmac_mul mul_12(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_12),
                          .weight   (cmac_wt_12),
                          .result   (mul_result_12));

    ytydla_cmac_mul mul_13(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_13),
                          .weight   (cmac_wt_13),
                          .result   (mul_result_13));

    ytydla_cmac_mul mul_14(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_14),
                          .weight   (cmac_wt_14),
                          .result   (mul_result_14));

    ytydla_cmac_mul mul_15(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_15),
                          .weight   (cmac_wt_15),
                          .result   (mul_result_15));

    ytydla_cmac_mul mul_16(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_16),
                          .weight   (cmac_wt_16),
                          .result   (mul_result_16));

    ytydla_cmac_mul mul_17(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_17),
                          .weight   (cmac_wt_17),
                          .result   (mul_result_17));

    ytydla_cmac_mul mul_18(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_18),
                          .weight   (cmac_wt_18),
                          .result   (mul_result_18));

    ytydla_cmac_mul mul_19(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_19),
                          .weight   (cmac_wt_19),
                          .result   (mul_result_19));

    ytydla_cmac_mul mul_20(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_20),
                          .weight   (cmac_wt_20),
                          .result   (mul_result_20));

    ytydla_cmac_mul mul_21(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_21),
                          .weight   (cmac_wt_21),
                          .result   (mul_result_21));

    ytydla_cmac_mul mul_22(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_22),
                          .weight   (cmac_wt_22),
                          .result   (mul_result_22));

    ytydla_cmac_mul mul_23(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_23),
                          .weight   (cmac_wt_23),
                          .result   (mul_result_23));

    ytydla_cmac_mul mul_24(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_24),
                          .weight   (cmac_wt_24),
                          .result   (mul_result_24));

    ytydla_cmac_mul mul_25(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_25),
                          .weight   (cmac_wt_25),
                          .result   (mul_result_25));

    ytydla_cmac_mul mul_26(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_26),
                          .weight   (cmac_wt_26),
                          .result   (mul_result_26));

    ytydla_cmac_mul mul_27(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_27),
                          .weight   (cmac_wt_27),
                          .result   (mul_result_27));

    ytydla_cmac_mul mul_28(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_28),
                          .weight   (cmac_wt_28),
                          .result   (mul_result_28));

    ytydla_cmac_mul mul_29(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_29),
                          .weight   (cmac_wt_29),
                          .result   (mul_result_29));

    ytydla_cmac_mul mul_30(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_30),
                          .weight   (cmac_wt_30),
                          .result   (mul_result_30));

    ytydla_cmac_mul mul_31(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_31),
                          .weight   (cmac_wt_31),
                          .result   (mul_result_31));

    ytydla_cmac_mul mul_32(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_32),
                          .weight   (cmac_wt_32),
                          .result   (mul_result_32));

    ytydla_cmac_mul mul_33(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_33),
                          .weight   (cmac_wt_33),
                          .result   (mul_result_33));

    ytydla_cmac_mul mul_34(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_34),
                          .weight   (cmac_wt_34),
                          .result   (mul_result_34));

    ytydla_cmac_mul mul_35(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_35),
                          .weight   (cmac_wt_35),
                          .result   (mul_result_35));

    ytydla_cmac_mul mul_36(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_36),
                          .weight   (cmac_wt_36),
                          .result   (mul_result_36));

    ytydla_cmac_mul mul_37(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_37),
                          .weight   (cmac_wt_37),
                          .result   (mul_result_37));

    ytydla_cmac_mul mul_38(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_38),
                          .weight   (cmac_wt_38),
                          .result   (mul_result_38));

    ytydla_cmac_mul mul_39(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_39),
                          .weight   (cmac_wt_39),
                          .result   (mul_result_39));

    ytydla_cmac_mul mul_40(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_40),
                          .weight   (cmac_wt_40),
                          .result   (mul_result_40));

    ytydla_cmac_mul mul_41(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_41),
                          .weight   (cmac_wt_41),
                          .result   (mul_result_41));

    ytydla_cmac_mul mul_42(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_42),
                          .weight   (cmac_wt_42),
                          .result   (mul_result_42));

    ytydla_cmac_mul mul_43(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_43),
                          .weight   (cmac_wt_43),
                          .result   (mul_result_43));

    ytydla_cmac_mul mul_44(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_44),
                          .weight   (cmac_wt_44),
                          .result   (mul_result_44));

    ytydla_cmac_mul mul_45(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_45),
                          .weight   (cmac_wt_45),
                          .result   (mul_result_45));

    ytydla_cmac_mul mul_46(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_46),
                          .weight   (cmac_wt_46),
                          .result   (mul_result_46));

    ytydla_cmac_mul mul_47(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_47),
                          .weight   (cmac_wt_47),
                          .result   (mul_result_47));

    ytydla_cmac_mul mul_48(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_48),
                          .weight   (cmac_wt_48),
                          .result   (mul_result_48));

    ytydla_cmac_mul mul_49(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_49),
                          .weight   (cmac_wt_49),
                          .result   (mul_result_49));

    ytydla_cmac_mul mul_50(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_50),
                          .weight   (cmac_wt_50),
                          .result   (mul_result_50));

    ytydla_cmac_mul mul_51(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_51),
                          .weight   (cmac_wt_51),
                          .result   (mul_result_51));

    ytydla_cmac_mul mul_52(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_52),
                          .weight   (cmac_wt_52),
                          .result   (mul_result_52));

    ytydla_cmac_mul mul_53(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_53),
                          .weight   (cmac_wt_53),
                          .result   (mul_result_53));

    ytydla_cmac_mul mul_54(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_54),
                          .weight   (cmac_wt_54),
                          .result   (mul_result_54));

    ytydla_cmac_mul mul_55(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_55),
                          .weight   (cmac_wt_55),
                          .result   (mul_result_55));

    ytydla_cmac_mul mul_56(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_56),
                          .weight   (cmac_wt_56),
                          .result   (mul_result_56));

    ytydla_cmac_mul mul_57(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_57),
                          .weight   (cmac_wt_57),
                          .result   (mul_result_57));

    ytydla_cmac_mul mul_58(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_58),
                          .weight   (cmac_wt_58),
                          .result   (mul_result_58));

    ytydla_cmac_mul mul_59(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_59),
                          .weight   (cmac_wt_59),
                          .result   (mul_result_59));

    ytydla_cmac_mul mul_60(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_60),
                          .weight   (cmac_wt_60),
                          .result   (mul_result_60));

    ytydla_cmac_mul mul_61(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_61),
                          .weight   (cmac_wt_61),
                          .result   (mul_result_61));

    ytydla_cmac_mul mul_62(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_62),
                          .weight   (cmac_wt_62),
                          .result   (mul_result_62));

    ytydla_cmac_mul mul_63(.clk      (ytydla_core_clk),
                          .rst_n    (ytydla_core_rst_n),
                          .data     (cmac_dat_63),
                          .weight   (cmac_wt_63),
                          .result   (mul_result_63));




    ytydla_cmac_accu   cmac_accu(
                                .ytydla_core_clk    (ytydla_core_clk),
                                .ytydla_core_rst_n  (ytydla_core_rst_n),
                                .cmac2accu_valid    (cmac2accu_valid),
                                .cmac2accu_adder_0  (mul_result_0),
                                .cmac2accu_adder_1  (mul_result_1),
                                .cmac2accu_adder_2  (mul_result_2),
                                .cmac2accu_adder_3  (mul_result_3),
                                .cmac2accu_adder_4  (mul_result_4),
                                .cmac2accu_adder_5  (mul_result_5),
                                .cmac2accu_adder_6  (mul_result_6),
                                .cmac2accu_adder_7  (mul_result_7),
                                .cmac2accu_adder_8  (mul_result_8),
                                .cmac2accu_adder_9  (mul_result_9),
                                .cmac2accu_adder_10  (mul_result_10),
                                .cmac2accu_adder_11  (mul_result_11),
                                .cmac2accu_adder_12  (mul_result_12),
                                .cmac2accu_adder_13  (mul_result_13),
                                .cmac2accu_adder_14  (mul_result_14),
                                .cmac2accu_adder_15  (mul_result_15),
                                .cmac2accu_adder_16  (mul_result_16),
                                .cmac2accu_adder_17  (mul_result_17),
                                .cmac2accu_adder_18  (mul_result_18),
                                .cmac2accu_adder_19  (mul_result_19),
                                .cmac2accu_adder_20  (mul_result_20),
                                .cmac2accu_adder_21  (mul_result_21),
                                .cmac2accu_adder_22  (mul_result_22),
                                .cmac2accu_adder_23  (mul_result_23),
                                .cmac2accu_adder_24  (mul_result_24),
                                .cmac2accu_adder_25  (mul_result_25),
                                .cmac2accu_adder_26  (mul_result_26),
                                .cmac2accu_adder_27  (mul_result_27),
                                .cmac2accu_adder_28  (mul_result_28),
                                .cmac2accu_adder_29  (mul_result_29),
                                .cmac2accu_adder_30  (mul_result_30),
                                .cmac2accu_adder_31  (mul_result_31),
                                .cmac2accu_adder_32  (mul_result_32),
                                .cmac2accu_adder_33  (mul_result_33),
                                .cmac2accu_adder_34  (mul_result_34),
                                .cmac2accu_adder_35  (mul_result_35),
                                .cmac2accu_adder_36  (mul_result_36),
                                .cmac2accu_adder_37  (mul_result_37),
                                .cmac2accu_adder_38  (mul_result_38),
                                .cmac2accu_adder_39  (mul_result_39),
                                .cmac2accu_adder_40  (mul_result_40),
                                .cmac2accu_adder_41  (mul_result_41),
                                .cmac2accu_adder_42  (mul_result_42),
                                .cmac2accu_adder_43  (mul_result_43),
                                .cmac2accu_adder_44  (mul_result_44),
                                .cmac2accu_adder_45  (mul_result_45),
                                .cmac2accu_adder_46  (mul_result_46),
                                .cmac2accu_adder_47  (mul_result_47),
                                .cmac2accu_adder_48  (mul_result_48),
                                .cmac2accu_adder_49  (mul_result_49),
                                .cmac2accu_adder_50  (mul_result_50),
                                .cmac2accu_adder_51  (mul_result_51),
                                .cmac2accu_adder_52  (mul_result_52),
                                .cmac2accu_adder_53  (mul_result_53),
                                .cmac2accu_adder_54  (mul_result_54),
                                .cmac2accu_adder_55  (mul_result_55),
                                .cmac2accu_adder_56  (mul_result_56),
                                .cmac2accu_adder_57  (mul_result_57),
                                .cmac2accu_adder_58  (mul_result_58),
                                .cmac2accu_adder_59  (mul_result_59),
                                .cmac2accu_adder_60  (mul_result_60),
                                .cmac2accu_adder_61  (mul_result_61),
                                .cmac2accu_adder_62  (mul_result_62),
                                .cmac2accu_adder_63  (mul_result_63),
                                .accu2cmac_aggregation (cmac2mem_result),
                                .accu2cmac_valid     (accu2cmac_valid));
endmodule
