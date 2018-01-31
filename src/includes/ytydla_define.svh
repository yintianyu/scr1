// ytydla_define.svh

`ifndef YTYDLA_DEFINE_SVH
`define YTYDLA_DEFINE_SVH

`define YTYDLA_DATA_LENGTH  32
`define YTYDLA_DATA_DOTPOT  12


`define YTYDLA_MEMORY_POWER 16

`define YTYDLA_LSU_WIDTH    (`YTYDLA_DATA_LENGTH * 5)


typedef enum logic[1:0]{
    ACCU_FSM_IDLE = 2'b00,
    ACCU_FSM_CAL,
    ACCU_FSM_VLD
}cmac_accu_fsm_e;

typedef enum logic[1:0]{
    DLA_LS_TYPE_NONE = 2'b00,
    DLA_LS_TYPE_DATA,
    DLA_LS_TYPE_WEIGHT
}dla_ls_type_e;

`endif // ~YTYDLA_DEFINE_SVH
