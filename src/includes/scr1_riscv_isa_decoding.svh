`ifndef SCR1_RISCV_ISA_DECODING_SVH
`define SCR1_RISCV_ISA_DECODING_SVH
/// Copyright by Syntacore LLC © 2016, 2017. See LICENSE for details
/// @file       <scr1_riscv_isa_decoding.svh>
/// @brief      RISC-V ISA Definitions file
///

`include "scr1_arch_description.svh"
`include "scr1_arch_types.svh"

//-------------------------------------------------------------------------------
// Instruction types
//-------------------------------------------------------------------------------
typedef enum logic [1:0] {
    SCR1_INSTR_RVC0     = 2'b00,
    SCR1_INSTR_RVC1     = 2'b01,
    SCR1_INSTR_RVC2     = 2'b10,
    SCR1_INSTR_RVI      = 2'b11
} type_scr1_instr_type_e;

//-------------------------------------------------------------------------------
// RV32I opcodes (bits 6:2)
//-------------------------------------------------------------------------------
`ifdef SCR1_RVY_EXT
typedef enum logic [6:2] {
    SCR1_OPCODE_LOAD        = 5'b00000,
    SCR1_OPCODE_MISC_MEM    = 5'b00011,
    SCR1_OPCODE_OP_IMM      = 5'b00100,
    SCR1_OPCODE_AUIPC       = 5'b00101,
    SCR1_OPCODE_STORE       = 5'b01000,
    SCR1_OPCODE_OP          = 5'b01100,
    SCR1_OPCODE_LUI         = 5'b01101,
    SCR1_OPCODE_BRANCH      = 5'b11000,
    SCR1_OPCODE_JALR        = 5'b11001,
    SCR1_OPCODE_JAL         = 5'b11011,
    SCR1_OPCODE_SYSTEM      = 5'b11100,
    SCR1_OPCODE_LOAD_Y      = 5'b00001,
    SCR1_OPCODE_STORE_Y     = 5'b01001,
    SCR1_OPCODE_OP_DLA      = 5'b01110,
    SCR1_OPCODE_SHIFT       = 5'b01010
} type_scr1_rvi_opcode_e;
`else
typedef enum logic [6:2] {
    SCR1_OPCODE_LOAD        = 5'b00000,
    SCR1_OPCODE_MISC_MEM    = 5'b00011,
    SCR1_OPCODE_OP_IMM      = 5'b00100,
    SCR1_OPCODE_AUIPC       = 5'b00101,
    SCR1_OPCODE_STORE       = 5'b01000,
    SCR1_OPCODE_OP          = 5'b01100,
    SCR1_OPCODE_LUI         = 5'b01101,
    SCR1_OPCODE_BRANCH      = 5'b11000,
    SCR1_OPCODE_JALR        = 5'b11001,
    SCR1_OPCODE_JAL         = 5'b11011,
    SCR1_OPCODE_SYSTEM      = 5'b11100
} type_scr1_rvi_opcode_e;
`endif   // SCR1_RVY_EXT



//-------------------------------------------------------------------------------
// IALU main operands
//-------------------------------------------------------------------------------
localparam SCR1_IALU_OP_ALL_NUM_E = 2;
localparam SCR1_IALU_OP_WIDTH_E   = $clog2(SCR1_IALU_OP_ALL_NUM_E);
typedef enum logic [SCR1_IALU_OP_WIDTH_E-1:0] {
    SCR1_IALU_OP_REG_IMM,          // op1 = rs1; op2 = imm
    SCR1_IALU_OP_REG_REG           // op1 = rs1; op2 = rs2
} type_scr1_ialu_op_sel_e;

//-------------------------------------------------------------------------------
// IALU main commands
//-------------------------------------------------------------------------------
`ifdef SCR1_RVM_EXT
localparam SCR1_IALU_CMD_ALL_NUM_E    = 23;
`else // ~SCR1_RVM_EXT
localparam SCR1_IALU_CMD_ALL_NUM_E    = 15;
`endif // ~SCR1_RVM_EXT
localparam SCR1_IALU_CMD_WIDTH_E      = $clog2(SCR1_IALU_CMD_ALL_NUM_E);
typedef enum logic [SCR1_IALU_CMD_WIDTH_E-1:0] {
    SCR1_IALU_CMD_NONE  = '0,   // IALU disable
    SCR1_IALU_CMD_AND,          // op1 & op2
    SCR1_IALU_CMD_OR,           // op1 | op2
    SCR1_IALU_CMD_XOR,          // op1 ^ op2
    SCR1_IALU_CMD_ADD,          // op1 + op2
    SCR1_IALU_CMD_SUB,          // op1 - op2
    SCR1_IALU_CMD_SUB_LT,       // op1 < op2
    SCR1_IALU_CMD_SUB_LTU,      // op1 u< op2
    SCR1_IALU_CMD_SUB_EQ,       // op1 = op2
    SCR1_IALU_CMD_SUB_NE,       // op1 != op2
    SCR1_IALU_CMD_SUB_GE,       // op1 >= op2
    SCR1_IALU_CMD_SUB_GEU,      // op1 u>= op2
    SCR1_IALU_CMD_SLL,          // op1 << op2
    SCR1_IALU_CMD_SRL,          // op1 >> op2
    SCR1_IALU_CMD_SRA           // op1 >>> op2
`ifdef SCR1_RVM_EXT
    ,
    SCR1_IALU_CMD_MUL,          // low(unsig(op1) * unsig(op2))
    SCR1_IALU_CMD_MULHU,        // high(unsig(op1) * unsig(op2))
    SCR1_IALU_CMD_MULHSU,       // high(op1 * unsig(op2))
    SCR1_IALU_CMD_MULH,         // high(op1 * op2)
    SCR1_IALU_CMD_DIV,          // op1 / op2
    SCR1_IALU_CMD_DIVU,         // op1 u/ op2
    SCR1_IALU_CMD_REM,          // op1 % op2
    SCR1_IALU_CMD_REMU          // op1 u% op2
`endif  // SCR1_RVM_EXT
`ifdef SCR1_RVY_EXT
    ,
    SCR1_IALU_CMD_CMAC          // *(op1) inner product with *(op2)
`endif  // SCR1_RVY_EXT
} type_scr1_ialu_cmd_sel_e;

//-------------------------------------------------------------------------------
// IALU SUM2 operands (result is JUMP/BRANCH target, LOAD/STORE address)
//-------------------------------------------------------------------------------
localparam SCR1_SUM2_OP_ALL_NUM_E    = 2;
localparam SCR1_SUM2_OP_WIDTH_E      = $clog2(SCR1_SUM2_OP_ALL_NUM_E);
typedef enum logic [SCR1_SUM2_OP_WIDTH_E-1:0] {
    SCR1_SUM2_OP_PC_IMM,            // op1 = curr_pc; op2 = imm (AUIPC, target new_pc for JAL and branches)
    SCR1_SUM2_OP_REG_IMM,           // op1 = rs1; op2 = imm (target new_pc for JALR, LOAD/STORE address)
    SCR1_SUM2_OP_ERROR = 'x
} type_scr1_ialu_sum2_op_sel_e;

//-------------------------------------------------------------------------------
// LSU commands
//-------------------------------------------------------------------------------
localparam SCR1_LSU_CMD_ALL_NUM_E   = 9;
localparam SCR1_LSU_CMD_WIDTH_E     = $clog2(SCR1_LSU_CMD_ALL_NUM_E);
typedef enum logic [SCR1_LSU_CMD_WIDTH_E-1:0] {
    SCR1_LSU_CMD_NONE = '0,
    SCR1_LSU_CMD_LB,
    SCR1_LSU_CMD_LH,
    SCR1_LSU_CMD_LW,
    SCR1_LSU_CMD_LBU,
    SCR1_LSU_CMD_LHU,
    SCR1_LSU_CMD_SB,
    SCR1_LSU_CMD_SH,
    SCR1_LSU_CMD_SW
} type_scr1_lsu_cmd_sel_e;



//-------------------------------------------------------------------------------
// LSU Highspeed commands
//-------------------------------------------------------------------------------
`ifdef SCR1_RVY_EXT
localparam SCR1_LSU_Y_CMD_ALL_NUM_E   = 6;
localparam SCR1_LSU_Y_CMD_WIDTH_E     = $clog2(SCR1_LSU_Y_CMD_ALL_NUM_E);
typedef enum logic [SCR1_LSU_Y_CMD_WIDTH_E-1:0] {
    SCR1_LSU_Y_CMD_NONE = '0,
    SCR1_LSU_Y_CMD_ONE_WORD,
    SCR1_LSU_Y_CMD_TWO_WORDS,
    SCR1_LSU_Y_CMD_THREE_WORDS,
    SCR1_LSU_Y_CMD_FOUR_WORDS,
    SCR1_LSU_Y_CMD_FIVE_WORDS
} type_scr1_lsu_y_cmd_sel_e;
`endif  // SCR1_RVY_EXT

//-------------------------------------------------------------------------------
// CSR operands
//-------------------------------------------------------------------------------
localparam SCR1_CSR_OP_ALL_NUM_E   = 2;
localparam SCR1_CSR_OP_WIDTH_E     = $clog2(SCR1_CSR_OP_ALL_NUM_E);
typedef enum logic [SCR1_CSR_OP_WIDTH_E-1:0] {
    SCR1_CSR_OP_IMM,
    SCR1_CSR_OP_REG
} type_scr1_csr_op_sel_e;

//-------------------------------------------------------------------------------
// CSR commands
//-------------------------------------------------------------------------------
localparam SCR1_CSR_CMD_ALL_NUM_E   = 4;
localparam SCR1_CSR_CMD_WIDTH_E     = $clog2(SCR1_CSR_CMD_ALL_NUM_E);
typedef enum logic [SCR1_CSR_CMD_WIDTH_E-1:0] {
    SCR1_CSR_CMD_NONE = '0,
    SCR1_CSR_CMD_WRITE,
    SCR1_CSR_CMD_SET,
    SCR1_CSR_CMD_CLEAR
} type_scr1_csr_cmd_sel_e;

//-------------------------------------------------------------------------------
// DLA commands
//-------------------------------------------------------------------------------
`ifdef SCR1_RVY_EXT
localparam SCR1_DLA_CMD_ALL_NUM_E   = 5;
localparam SCR1_DLA_CMD_WIDTH_E     = $clog2(SCR1_DLA_CMD_ALL_NUM_E);
typedef enum logic [SCR1_DLA_CMD_WIDTH_E-1:0] {
    SCR1_DLA_CMD_NONE = '0,
    SCR1_DLA_CMD_CMAC,
    SCR1_DLA_CMD_VINP,
    SCR1_DLA_CMD_SHIFT_DAT,
    SCR1_DLA_CMD_SHIFT_WT
} type_scr1_dla_cmd_sel_e;
`endif  // SCR1_RVY_EXT

//-------------------------------------------------------------------------------
// MPRF rd writeback source
//-------------------------------------------------------------------------------
localparam SCR1_RD_WB_ALL_NUM_E = 8;
localparam SCR1_RD_WB_WIDTH_E   = $clog2(SCR1_RD_WB_ALL_NUM_E);
typedef enum logic [SCR1_RD_WB_WIDTH_E-1:0] {
    SCR1_RD_WB_NONE = '0,
    SCR1_RD_WB_IALU,            // IALU main result
    SCR1_RD_WB_SUM2,            // IALU SUM2 result (AUIPC)
    SCR1_RD_WB_DLA,
    SCR1_RD_WB_IMM,             // LUI
    SCR1_RD_WB_INC_PC,          // JAL(R)
    SCR1_RD_WB_LSU,             // Load from DMEM
    SCR1_RD_WB_CSR              // Read CSR
} type_scr1_rd_wb_sel_e;

//-------------------------------------------------------------------------------
// IDU to EXU full command structure
//-------------------------------------------------------------------------------
localparam SCR1_GPR_FIELD_WIDTH = 5;

typedef struct packed {
    logic                               instr_rvc;      // used with a different meaning for IFU access fault exception
    type_scr1_ialu_op_sel_e             ialu_op;
    type_scr1_ialu_cmd_sel_e            ialu_cmd;
    type_scr1_ialu_sum2_op_sel_e        sum2_op;
    type_scr1_lsu_cmd_sel_e             lsu_cmd;
    type_scr1_csr_op_sel_e              csr_op;
    type_scr1_csr_cmd_sel_e             csr_cmd;
    type_scr1_rd_wb_sel_e               rd_wb_sel;
`ifdef SCR1_RVY_EXT
    type_scr1_rd_wb_sel_e               rd_wb_y_sel;
    logic [8:0]                         rd_wb_y_addr;
    type_scr1_dla_cmd_sel_e             dla_cmd;
    type_scr1_lsu_y_cmd_sel_e           lsu_y_cmd;
    
`endif  // SCR1_RVY_EXT
    logic                               jump_req;
    logic                               branch_req;
    logic                               mret_req;
    logic                               fencei_req;
    logic                               wfi_req;
    logic [SCR1_GPR_FIELD_WIDTH-1:0]    rs1_addr;       // used as zimm for CSRRxI instructions
    logic [SCR1_GPR_FIELD_WIDTH-1:0]    rs2_addr;
    logic [SCR1_GPR_FIELD_WIDTH-1:0]    rd_addr;
    logic [`SCR1_XLEN-1:0]              imm;            // used as {funct3, CSR address} for CSR instructions
                                                        // used as instruction field for illegal instruction exception
    logic                               exc_req;
    type_scr1_exc_code_e                exc_code;
} type_scr1_exu_cmd_s;


//-------------------------------------------------------------------------------
// IDU to EXU full command structure
//-------------------------------------------------------------------------------
`ifdef SCR1_INSTR_SORT
`ifndef SCR1_RVC_EXT
localparam SCR1_INSTR_SORT_ALL_NUM_E = 4;
`else
localparam SCR1_INSTR_SORT_ALL_NUM_E = 10;
`endif // ~SCR1_RVC_EXT
localparam SCR1_INSTR_SORT_WIDTH_E = $clog2(SCR1_INSTR_SORT_ALL_NUM_E);
typedef enum logic[SCR1_INSTR_SORT_WIDTH_E - 1: 0]{
    SCR1_INSTR_SORT_RVI_CAL = '0,
    SCR1_INSTR_SORT_RVI_CTRL,
    SCR1_INSTR_SORT_RVI_LS,
    SCR1_INSTR_SORT_RVI_OTHER
`ifdef SCR1_RVC_EXT
    ,
    SCR1_INSTR_SORT_RVC_CAL,
    SCR1_INSTR_SORT_RVC_CTRL,
    SCR1_INSTR_SORT_RVC_LS,
    SCR1_INSTR_SORT_RVC_OTHER
`endif // SCR1_RVC_EXT
`ifdef SCR1_RVY_EXT
    ,
    SCR1_INSTR_SORT_RVY_CAL,
    SCR1_INSTR_SORT_RVY_LS
`endif // SCR1_RVY_EXT
} type_scr1_instr_sort_sel_e;
`endif // SCR1_INSTR_SORT

`endif // SCR1_RISCV_ISA_DECODING_SVH

