// ytydla.sv


module ytydla(
    input           clk,
    input           rst_n,
    input                       dla_req,
    input   [`SCR1_XLEN-1:0]    size,
    output  logic [`SCR1_XLEN-1:0]    result,
    output  logic                    res_vld,

    input   [`YTYDLA_LSU_WIDTH-1:0]     exu2dla_wdata,
    input                               exu2dla_wreq,
    input   [8:0]                       exu2dla_waddr,
    input   [2:0]                       exu2dla_wsize,
    input   [11:0]                      shift_size,
    input                               shift_req,
    input                               shift_type     // 0-data; 1-weight
    );
logic   [7:0]               reg_file[511:0];

//-------------------------------------------------------------------------------
// Write Register File & Shift Register
//-------------------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        
    end
    else begin
        if (exu2dla_wreq) begin
            case (exu2dla_wsize)
                3'b001:begin
                    reg_file[exu2dla_waddr + 0] <= exu2dla_wdata[7:0];
                    reg_file[exu2dla_waddr + 1] <= exu2dla_wdata[15:8];
                    reg_file[exu2dla_waddr + 2] <= exu2dla_wdata[23:16];
                    reg_file[exu2dla_waddr + 3] <= exu2dla_wdata[31:24];
//                  reg_file[exu2dla_waddr + 3:exu2dla_waddr] <= exu2dla_wdata[31:0];
                end
                3'b010:begin
                    reg_file[exu2dla_waddr + 0] <= exu2dla_wdata[7:0];
                    reg_file[exu2dla_waddr + 1] <= exu2dla_wdata[15:8];
                    reg_file[exu2dla_waddr + 2] <= exu2dla_wdata[23:16];
                    reg_file[exu2dla_waddr + 3] <= exu2dla_wdata[31:24];
                    reg_file[exu2dla_waddr + 4] <= exu2dla_wdata[39:32];
                    reg_file[exu2dla_waddr + 5] <= exu2dla_wdata[47:40];
                    reg_file[exu2dla_waddr + 6] <= exu2dla_wdata[55:48];
                    reg_file[exu2dla_waddr + 7] <= exu2dla_wdata[63:56];
//                  reg_file[exu2dla_waddr + 7:exu2dla_waddr] <= exu2dla_wdata[63:0];
                end
                3'b011:begin
                    reg_file[exu2dla_waddr + 0] <= exu2dla_wdata[7:0];
                    reg_file[exu2dla_waddr + 1] <= exu2dla_wdata[15:8];
                    reg_file[exu2dla_waddr + 2] <= exu2dla_wdata[23:16];
                    reg_file[exu2dla_waddr + 3] <= exu2dla_wdata[31:24];
                    reg_file[exu2dla_waddr + 4] <= exu2dla_wdata[39:32];
                    reg_file[exu2dla_waddr + 5] <= exu2dla_wdata[47:40];
                    reg_file[exu2dla_waddr + 6] <= exu2dla_wdata[55:48];
                    reg_file[exu2dla_waddr + 7] <= exu2dla_wdata[63:56];
                    reg_file[exu2dla_waddr + 8] <= exu2dla_wdata[71:64];
                    reg_file[exu2dla_waddr + 9] <= exu2dla_wdata[79:72];
                    reg_file[exu2dla_waddr + 10] <= exu2dla_wdata[87:80];
                    reg_file[exu2dla_waddr + 11] <= exu2dla_wdata[95:88];
//                  reg_file[exu2dla_waddr + 11:exu2dla_waddr] <= exu2dla_wdata[95:0];
                end
                3'b100:begin
                    reg_file[exu2dla_waddr + 0] <= exu2dla_wdata[7:0];
                    reg_file[exu2dla_waddr + 1] <= exu2dla_wdata[15:8];
                    reg_file[exu2dla_waddr + 2] <= exu2dla_wdata[23:16];
                    reg_file[exu2dla_waddr + 3] <= exu2dla_wdata[31:24];
                    reg_file[exu2dla_waddr + 4] <= exu2dla_wdata[39:32];
                    reg_file[exu2dla_waddr + 5] <= exu2dla_wdata[47:40];
                    reg_file[exu2dla_waddr + 6] <= exu2dla_wdata[55:48];
                    reg_file[exu2dla_waddr + 7] <= exu2dla_wdata[63:56];
                    reg_file[exu2dla_waddr + 8] <= exu2dla_wdata[71:64];
                    reg_file[exu2dla_waddr + 9] <= exu2dla_wdata[79:72];
                    reg_file[exu2dla_waddr + 10] <= exu2dla_wdata[87:80];
                    reg_file[exu2dla_waddr + 11] <= exu2dla_wdata[95:88];
                    reg_file[exu2dla_waddr + 12] <= exu2dla_wdata[103:96];
                    reg_file[exu2dla_waddr + 13] <= exu2dla_wdata[111:104];
                    reg_file[exu2dla_waddr + 14] <= exu2dla_wdata[119:112];
                    reg_file[exu2dla_waddr + 15] <= exu2dla_wdata[127:120];
//                  reg_file[exu2dla_waddr + 15:exu2dla_waddr] <= exu2dla_wdata[127:0];
                end
                3'b101:begin
                    reg_file[exu2dla_waddr + 0] <= exu2dla_wdata[7:0];
                    reg_file[exu2dla_waddr + 1] <= exu2dla_wdata[15:8];
                    reg_file[exu2dla_waddr + 2] <= exu2dla_wdata[23:16];
                    reg_file[exu2dla_waddr + 3] <= exu2dla_wdata[31:24];
                    reg_file[exu2dla_waddr + 4] <= exu2dla_wdata[39:32];
                    reg_file[exu2dla_waddr + 5] <= exu2dla_wdata[47:40];
                    reg_file[exu2dla_waddr + 6] <= exu2dla_wdata[55:48];
                    reg_file[exu2dla_waddr + 7] <= exu2dla_wdata[63:56];
                    reg_file[exu2dla_waddr + 8] <= exu2dla_wdata[71:64];
                    reg_file[exu2dla_waddr + 9] <= exu2dla_wdata[79:72];
                    reg_file[exu2dla_waddr + 10] <= exu2dla_wdata[87:80];
                    reg_file[exu2dla_waddr + 11] <= exu2dla_wdata[95:88];
                    reg_file[exu2dla_waddr + 12] <= exu2dla_wdata[103:96];
                    reg_file[exu2dla_waddr + 13] <= exu2dla_wdata[111:104];
                    reg_file[exu2dla_waddr + 14] <= exu2dla_wdata[119:112];
                    reg_file[exu2dla_waddr + 15] <= exu2dla_wdata[127:120];
                    reg_file[exu2dla_waddr + 16] <= exu2dla_wdata[135:128];
                    reg_file[exu2dla_waddr + 17] <= exu2dla_wdata[143:136];
                    reg_file[exu2dla_waddr + 18] <= exu2dla_wdata[151:144];
                    reg_file[exu2dla_waddr + 19] <= exu2dla_wdata[159:152];
//                  reg_file[exu2dla_waddr + 19:exu2dla_waddr] <= exu2dla_wdata[159:0];
                end
                default:begin end
            endcase
        end
        else if (shift_req) begin
            if(shift_type == 0)begin
                case (shift_size)
                    12'h3: begin
                        reg_file[0] <= reg_file[12];
                        reg_file[1] <= reg_file[13];
                        reg_file[2] <= reg_file[14];
                        reg_file[3] <= reg_file[15];
                        reg_file[4] <= reg_file[16];
                        reg_file[5] <= reg_file[17];
                        reg_file[6] <= reg_file[18];
                        reg_file[7] <= reg_file[19];
                        reg_file[8] <= reg_file[20];
                        reg_file[9] <= reg_file[21];
                        reg_file[10] <= reg_file[22];
                        reg_file[11] <= reg_file[23];
                        reg_file[12] <= reg_file[24];
                        reg_file[13] <= reg_file[25];
                        reg_file[14] <= reg_file[26];
                        reg_file[15] <= reg_file[27];
                        reg_file[16] <= reg_file[28];
                        reg_file[17] <= reg_file[29];
                        reg_file[18] <= reg_file[30];
                        reg_file[19] <= reg_file[31];
                        reg_file[20] <= reg_file[32];
                        reg_file[21] <= reg_file[33];
                        reg_file[22] <= reg_file[34];
                        reg_file[23] <= reg_file[35];
                    end
                    12'h5:begin
                        reg_file[0] <= reg_file[20];
                        reg_file[1] <= reg_file[21];
                        reg_file[2] <= reg_file[22];
                        reg_file[3] <= reg_file[23];
                        reg_file[4] <= reg_file[24];
                        reg_file[5] <= reg_file[25];
                        reg_file[6] <= reg_file[26];
                        reg_file[7] <= reg_file[27];
                        reg_file[8] <= reg_file[28];
                        reg_file[9] <= reg_file[29];
                        reg_file[10] <= reg_file[30];
                        reg_file[11] <= reg_file[31];
                        reg_file[12] <= reg_file[32];
                        reg_file[13] <= reg_file[33];
                        reg_file[14] <= reg_file[34];
                        reg_file[15] <= reg_file[35];
                        reg_file[16] <= reg_file[36];
                        reg_file[17] <= reg_file[37];
                        reg_file[18] <= reg_file[38];
                        reg_file[19] <= reg_file[39];
                        reg_file[20] <= reg_file[40];
                        reg_file[21] <= reg_file[41];
                        reg_file[22] <= reg_file[42];
                        reg_file[23] <= reg_file[43];
                        reg_file[24] <= reg_file[44];
                        reg_file[25] <= reg_file[45];
                        reg_file[26] <= reg_file[46];
                        reg_file[27] <= reg_file[47];
                        reg_file[28] <= reg_file[48];
                        reg_file[29] <= reg_file[49];
                        reg_file[30] <= reg_file[50];
                        reg_file[31] <= reg_file[51];
                        reg_file[32] <= reg_file[52];
                        reg_file[33] <= reg_file[53];
                        reg_file[34] <= reg_file[54];
                        reg_file[35] <= reg_file[55];
                        reg_file[36] <= reg_file[56];
                        reg_file[37] <= reg_file[57];
                        reg_file[38] <= reg_file[58];
                        reg_file[39] <= reg_file[59];
                        reg_file[40] <= reg_file[60];
                        reg_file[41] <= reg_file[61];
                        reg_file[42] <= reg_file[62];
                        reg_file[43] <= reg_file[63];
                        reg_file[44] <= reg_file[64];
                        reg_file[45] <= reg_file[65];
                        reg_file[46] <= reg_file[66];
                        reg_file[47] <= reg_file[67];
                        reg_file[48] <= reg_file[68];
                        reg_file[49] <= reg_file[69];
                        reg_file[50] <= reg_file[70];
                        reg_file[51] <= reg_file[71];
                        reg_file[52] <= reg_file[72];
                        reg_file[53] <= reg_file[73];
                        reg_file[54] <= reg_file[74];
                        reg_file[55] <= reg_file[75];
                        reg_file[56] <= reg_file[76];
                        reg_file[57] <= reg_file[77];
                        reg_file[58] <= reg_file[78];
                        reg_file[59] <= reg_file[79];
                        reg_file[60] <= reg_file[80];
                        reg_file[61] <= reg_file[81];
                        reg_file[62] <= reg_file[82];
                        reg_file[63] <= reg_file[83];
                        reg_file[64] <= reg_file[84];
                        reg_file[65] <= reg_file[85];
                        reg_file[66] <= reg_file[86];
                        reg_file[67] <= reg_file[87];
                        reg_file[68] <= reg_file[88];
                        reg_file[69] <= reg_file[89];
                        reg_file[70] <= reg_file[90];
                        reg_file[71] <= reg_file[91];
                        reg_file[72] <= reg_file[92];
                        reg_file[73] <= reg_file[93];
                        reg_file[74] <= reg_file[94];
                        reg_file[75] <= reg_file[95];
                        reg_file[76] <= reg_file[96];
                        reg_file[77] <= reg_file[97];
                        reg_file[78] <= reg_file[98];
                        reg_file[79] <= reg_file[99];
                    end
                    default: begin end
                endcase
            end
        end
    end
end


ytydla_cmac cmac_0(
    .ytydla_core_clk    (clk),
    .ytydla_core_rst_n  (rst_n),
    .mem2cmac_valid    (dla_req),
    .mem2cmac_dat_0     ({reg_file[3], reg_file[2], reg_file[1], reg_file[0]}),
    .mem2cmac_dat_1     ({reg_file[7], reg_file[6], reg_file[5], reg_file[4]}),
    .mem2cmac_dat_2     ({reg_file[11], reg_file[10], reg_file[9], reg_file[8]}),
    .mem2cmac_dat_3     ({reg_file[15], reg_file[14], reg_file[13], reg_file[12]}),
    .mem2cmac_dat_4     ({reg_file[19], reg_file[18], reg_file[17], reg_file[16]}),
    .mem2cmac_dat_5     ({reg_file[23], reg_file[22], reg_file[21], reg_file[20]}),
    .mem2cmac_dat_6     ({reg_file[27], reg_file[26], reg_file[25], reg_file[24]}),
    .mem2cmac_dat_7     ({reg_file[31], reg_file[30], reg_file[29], reg_file[28]}),
    .mem2cmac_dat_8     ({reg_file[35], reg_file[34], reg_file[33], reg_file[32]}),
    .mem2cmac_dat_9     ({reg_file[39], reg_file[38], reg_file[37], reg_file[36]}),
    .mem2cmac_dat_10    ({reg_file[43], reg_file[42], reg_file[41], reg_file[40]}),
    .mem2cmac_dat_11    ({reg_file[47], reg_file[46], reg_file[45], reg_file[44]}),
    .mem2cmac_dat_12    ({reg_file[51], reg_file[50], reg_file[49], reg_file[48]}),
    .mem2cmac_dat_13    ({reg_file[55], reg_file[54], reg_file[53], reg_file[52]}),
    .mem2cmac_dat_14    ({reg_file[59], reg_file[58], reg_file[57], reg_file[56]}),
    .mem2cmac_dat_15    ({reg_file[63], reg_file[62], reg_file[61], reg_file[60]}),
    .mem2cmac_dat_16    ({reg_file[67], reg_file[66], reg_file[65], reg_file[64]}),
    .mem2cmac_dat_17    ({reg_file[71], reg_file[70], reg_file[69], reg_file[68]}),
    .mem2cmac_dat_18    ({reg_file[75], reg_file[74], reg_file[73], reg_file[72]}),
    .mem2cmac_dat_19    ({reg_file[79], reg_file[78], reg_file[77], reg_file[76]}),
    .mem2cmac_dat_20    ({reg_file[83], reg_file[82], reg_file[81], reg_file[80]}),
    .mem2cmac_dat_21    ({reg_file[87], reg_file[86], reg_file[85], reg_file[84]}),
    .mem2cmac_dat_22    ({reg_file[91], reg_file[90], reg_file[89], reg_file[88]}),
    .mem2cmac_dat_23    ({reg_file[95], reg_file[94], reg_file[93], reg_file[92]}),
    .mem2cmac_dat_24    ({reg_file[99], reg_file[98], reg_file[97], reg_file[96]}),
    .mem2cmac_dat_25    ({reg_file[103], reg_file[102], reg_file[101], reg_file[100]}),
    .mem2cmac_dat_26    ({reg_file[107], reg_file[106], reg_file[105], reg_file[104]}),
    .mem2cmac_dat_27    ({reg_file[111], reg_file[110], reg_file[109], reg_file[108]}),
    .mem2cmac_dat_28    ({reg_file[115], reg_file[114], reg_file[113], reg_file[112]}),
    .mem2cmac_dat_29    ({reg_file[119], reg_file[118], reg_file[117], reg_file[116]}),
    .mem2cmac_dat_30    ({reg_file[123], reg_file[122], reg_file[121], reg_file[120]}),
    .mem2cmac_dat_31    ({reg_file[127], reg_file[126], reg_file[125], reg_file[124]}),
    .mem2cmac_dat_32    ({reg_file[131], reg_file[130], reg_file[129], reg_file[128]}),
    .mem2cmac_dat_33    ({reg_file[135], reg_file[134], reg_file[133], reg_file[132]}),
    .mem2cmac_dat_34    ({reg_file[139], reg_file[138], reg_file[137], reg_file[136]}),
    .mem2cmac_dat_35    ({reg_file[143], reg_file[142], reg_file[141], reg_file[140]}),
    .mem2cmac_dat_36    ({reg_file[147], reg_file[146], reg_file[145], reg_file[144]}),
    .mem2cmac_dat_37    ({reg_file[151], reg_file[150], reg_file[149], reg_file[148]}),
    .mem2cmac_dat_38    ({reg_file[155], reg_file[154], reg_file[153], reg_file[152]}),
    .mem2cmac_dat_39    ({reg_file[159], reg_file[158], reg_file[157], reg_file[156]}),
    .mem2cmac_dat_40    ({reg_file[163], reg_file[162], reg_file[161], reg_file[160]}),
    .mem2cmac_dat_41    ({reg_file[167], reg_file[166], reg_file[165], reg_file[164]}),
    .mem2cmac_dat_42    ({reg_file[171], reg_file[170], reg_file[169], reg_file[168]}),
    .mem2cmac_dat_43    ({reg_file[175], reg_file[174], reg_file[173], reg_file[172]}),
    .mem2cmac_dat_44    ({reg_file[179], reg_file[178], reg_file[177], reg_file[176]}),
    .mem2cmac_dat_45    ({reg_file[183], reg_file[182], reg_file[181], reg_file[180]}),
    .mem2cmac_dat_46    ({reg_file[187], reg_file[186], reg_file[185], reg_file[184]}),
    .mem2cmac_dat_47    ({reg_file[191], reg_file[190], reg_file[189], reg_file[188]}),
    .mem2cmac_dat_48    ({reg_file[195], reg_file[194], reg_file[193], reg_file[192]}),
    .mem2cmac_dat_49    ({reg_file[199], reg_file[198], reg_file[197], reg_file[196]}),
    .mem2cmac_dat_50    ({reg_file[203], reg_file[202], reg_file[201], reg_file[200]}),
    .mem2cmac_dat_51    ({reg_file[207], reg_file[206], reg_file[205], reg_file[204]}),
    .mem2cmac_dat_52    ({reg_file[211], reg_file[210], reg_file[209], reg_file[208]}),
    .mem2cmac_dat_53    ({reg_file[215], reg_file[214], reg_file[213], reg_file[212]}),
    .mem2cmac_dat_54    ({reg_file[219], reg_file[218], reg_file[217], reg_file[216]}),
    .mem2cmac_dat_55    ({reg_file[223], reg_file[222], reg_file[221], reg_file[220]}),
    .mem2cmac_dat_56    ({reg_file[227], reg_file[226], reg_file[225], reg_file[224]}),
    .mem2cmac_dat_57    ({reg_file[231], reg_file[230], reg_file[229], reg_file[228]}),
    .mem2cmac_dat_58    ({reg_file[235], reg_file[234], reg_file[233], reg_file[232]}),
    .mem2cmac_dat_59    ({reg_file[239], reg_file[238], reg_file[237], reg_file[236]}),
    .mem2cmac_dat_60    ({reg_file[243], reg_file[242], reg_file[241], reg_file[240]}),
    .mem2cmac_dat_61    ({reg_file[247], reg_file[246], reg_file[245], reg_file[244]}),
    .mem2cmac_dat_62    ({reg_file[251], reg_file[250], reg_file[249], reg_file[248]}),
    .mem2cmac_dat_63    ({reg_file[255], reg_file[254], reg_file[253], reg_file[252]}),
    .mem2cmac_dat_size  (size),
    .mem2cmac_wt_0     ({reg_file[259], reg_file[258], reg_file[257], reg_file[256]}),
    .mem2cmac_wt_1     ({reg_file[263], reg_file[262], reg_file[261], reg_file[260]}),
    .mem2cmac_wt_2     ({reg_file[267], reg_file[266], reg_file[265], reg_file[264]}),
    .mem2cmac_wt_3     ({reg_file[271], reg_file[270], reg_file[269], reg_file[268]}),
    .mem2cmac_wt_4     ({reg_file[275], reg_file[274], reg_file[273], reg_file[272]}),
    .mem2cmac_wt_5     ({reg_file[279], reg_file[278], reg_file[277], reg_file[276]}),
    .mem2cmac_wt_6     ({reg_file[283], reg_file[282], reg_file[281], reg_file[280]}),
    .mem2cmac_wt_7     ({reg_file[287], reg_file[286], reg_file[285], reg_file[284]}),
    .mem2cmac_wt_8     ({reg_file[291], reg_file[290], reg_file[289], reg_file[288]}),
    .mem2cmac_wt_9     ({reg_file[295], reg_file[294], reg_file[293], reg_file[292]}),
    .mem2cmac_wt_10     ({reg_file[299], reg_file[298], reg_file[297], reg_file[296]}),
    .mem2cmac_wt_11     ({reg_file[303], reg_file[302], reg_file[301], reg_file[300]}),
    .mem2cmac_wt_12     ({reg_file[307], reg_file[306], reg_file[305], reg_file[304]}),
    .mem2cmac_wt_13     ({reg_file[311], reg_file[310], reg_file[309], reg_file[308]}),
    .mem2cmac_wt_14     ({reg_file[315], reg_file[314], reg_file[313], reg_file[312]}),
    .mem2cmac_wt_15     ({reg_file[319], reg_file[318], reg_file[317], reg_file[316]}),
    .mem2cmac_wt_16     ({reg_file[323], reg_file[322], reg_file[321], reg_file[320]}),
    .mem2cmac_wt_17     ({reg_file[327], reg_file[326], reg_file[325], reg_file[324]}),
    .mem2cmac_wt_18     ({reg_file[331], reg_file[330], reg_file[329], reg_file[328]}),
    .mem2cmac_wt_19     ({reg_file[335], reg_file[334], reg_file[333], reg_file[332]}),
    .mem2cmac_wt_20     ({reg_file[339], reg_file[338], reg_file[337], reg_file[336]}),
    .mem2cmac_wt_21     ({reg_file[343], reg_file[342], reg_file[341], reg_file[340]}),
    .mem2cmac_wt_22     ({reg_file[347], reg_file[346], reg_file[345], reg_file[344]}),
    .mem2cmac_wt_23     ({reg_file[351], reg_file[350], reg_file[349], reg_file[348]}),
    .mem2cmac_wt_24     ({reg_file[355], reg_file[354], reg_file[353], reg_file[352]}),
    .mem2cmac_wt_25     ({reg_file[359], reg_file[358], reg_file[357], reg_file[356]}),
    .mem2cmac_wt_26     ({reg_file[363], reg_file[362], reg_file[361], reg_file[360]}),
    .mem2cmac_wt_27     ({reg_file[367], reg_file[366], reg_file[365], reg_file[364]}),
    .mem2cmac_wt_28     ({reg_file[371], reg_file[370], reg_file[369], reg_file[368]}),
    .mem2cmac_wt_29     ({reg_file[375], reg_file[374], reg_file[373], reg_file[372]}),
    .mem2cmac_wt_30     ({reg_file[379], reg_file[378], reg_file[377], reg_file[376]}),
    .mem2cmac_wt_31     ({reg_file[383], reg_file[382], reg_file[381], reg_file[380]}),
    .mem2cmac_wt_32     ({reg_file[387], reg_file[386], reg_file[385], reg_file[384]}),
    .mem2cmac_wt_33     ({reg_file[391], reg_file[390], reg_file[389], reg_file[388]}),
    .mem2cmac_wt_34     ({reg_file[395], reg_file[394], reg_file[393], reg_file[392]}),
    .mem2cmac_wt_35     ({reg_file[399], reg_file[398], reg_file[397], reg_file[396]}),
    .mem2cmac_wt_36     ({reg_file[403], reg_file[402], reg_file[401], reg_file[400]}),
    .mem2cmac_wt_37     ({reg_file[407], reg_file[406], reg_file[405], reg_file[404]}),
    .mem2cmac_wt_38     ({reg_file[411], reg_file[410], reg_file[409], reg_file[408]}),
    .mem2cmac_wt_39     ({reg_file[415], reg_file[414], reg_file[413], reg_file[412]}),
    .mem2cmac_wt_40     ({reg_file[419], reg_file[418], reg_file[417], reg_file[416]}),
    .mem2cmac_wt_41     ({reg_file[423], reg_file[422], reg_file[421], reg_file[420]}),
    .mem2cmac_wt_42     ({reg_file[427], reg_file[426], reg_file[425], reg_file[424]}),
    .mem2cmac_wt_43     ({reg_file[431], reg_file[430], reg_file[429], reg_file[428]}),
    .mem2cmac_wt_44     ({reg_file[435], reg_file[434], reg_file[433], reg_file[432]}),
    .mem2cmac_wt_45     ({reg_file[439], reg_file[438], reg_file[437], reg_file[436]}),
    .mem2cmac_wt_46     ({reg_file[443], reg_file[442], reg_file[441], reg_file[440]}),
    .mem2cmac_wt_47     ({reg_file[447], reg_file[446], reg_file[445], reg_file[444]}),
    .mem2cmac_wt_48     ({reg_file[451], reg_file[450], reg_file[449], reg_file[448]}),
    .mem2cmac_wt_49     ({reg_file[455], reg_file[454], reg_file[453], reg_file[452]}),
    .mem2cmac_wt_50     ({reg_file[459], reg_file[458], reg_file[457], reg_file[456]}),
    .mem2cmac_wt_51     ({reg_file[463], reg_file[462], reg_file[461], reg_file[460]}),
    .mem2cmac_wt_52     ({reg_file[467], reg_file[466], reg_file[465], reg_file[464]}),
    .mem2cmac_wt_53     ({reg_file[471], reg_file[470], reg_file[469], reg_file[468]}),
    .mem2cmac_wt_54     ({reg_file[475], reg_file[474], reg_file[473], reg_file[472]}),
    .mem2cmac_wt_55     ({reg_file[479], reg_file[478], reg_file[477], reg_file[476]}),
    .mem2cmac_wt_56     ({reg_file[483], reg_file[482], reg_file[481], reg_file[480]}),
    .mem2cmac_wt_57     ({reg_file[487], reg_file[486], reg_file[485], reg_file[484]}),
    .mem2cmac_wt_58     ({reg_file[491], reg_file[490], reg_file[489], reg_file[488]}),
    .mem2cmac_wt_59     ({reg_file[495], reg_file[494], reg_file[493], reg_file[492]}),
    .mem2cmac_wt_60     ({reg_file[499], reg_file[498], reg_file[497], reg_file[496]}),
    .mem2cmac_wt_61     ({reg_file[503], reg_file[502], reg_file[501], reg_file[500]}),
    .mem2cmac_wt_62     ({reg_file[507], reg_file[506], reg_file[505], reg_file[504]}),
    .mem2cmac_wt_63     ({reg_file[511], reg_file[510], reg_file[509], reg_file[508]}),
    .cmac2mem_result    (result),
    .cmac2mem_valid     (res_vld)
    );





endmodule
