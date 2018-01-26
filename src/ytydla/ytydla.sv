// ytydla.sv


module ytydla(
    input           clk,
    input           rst_n,
    input                       dla_req,
    input   [`SCR1_XLEN-1:0]    dat_addr,
    input   [`SCR1_XLEN-1:0]    wt_addr,
    input   [`SCR1_XLEN-1:0]    size,
    output  logic [`SCR1_XLEN-1:0]    result,
    output  logic                    res_vld,

    input   [`YTYDLA_LSU_WIDTH-1:0]     exu2dla_wdata,
    input                               exu2dla_wreq,
    input   [8:0]                       exu2dla_waddr
    );
logic   [7:0]               reg_file[0:1023];

//-------------------------------------------------------------------------------
// Write Register File
//-------------------------------------------------------------------------------
always_ff @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        
    end
    else begin
        if (exu2dla_wreq) begin
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
        end
    end
end

ytydla_cmac cmac_0(
    .ytydla_core_clk    (clk),
    .ytydla_core_rst_n  (rst_n),
    .mem2cmac_valid    (dla_req),
    .mem2cmac_dat_0     ({reg_file[dat_addr + 3], reg_file[dat_addr + 2], reg_file[dat_addr + 1], reg_file[dat_addr + 0]}),
    .mem2cmac_dat_1     ({reg_file[dat_addr + 7], reg_file[dat_addr + 6], reg_file[dat_addr + 5], reg_file[dat_addr + 4]}),
    .mem2cmac_dat_2     ({reg_file[dat_addr + 11], reg_file[dat_addr + 10], reg_file[dat_addr + 9], reg_file[dat_addr + 8]}),
    .mem2cmac_dat_3     ({reg_file[dat_addr + 15], reg_file[dat_addr + 14], reg_file[dat_addr + 13], reg_file[dat_addr + 12]}),
    .mem2cmac_dat_4     ({reg_file[dat_addr + 19], reg_file[dat_addr + 18], reg_file[dat_addr + 17], reg_file[dat_addr + 16]}),
    .mem2cmac_dat_5     ({reg_file[dat_addr + 23], reg_file[dat_addr + 22], reg_file[dat_addr + 21], reg_file[dat_addr + 20]}),
    .mem2cmac_dat_6     ({reg_file[dat_addr + 27], reg_file[dat_addr + 26], reg_file[dat_addr + 25], reg_file[dat_addr + 24]}),
    .mem2cmac_dat_7     ({reg_file[dat_addr + 31], reg_file[dat_addr + 30], reg_file[dat_addr + 29], reg_file[dat_addr + 28]}),
    .mem2cmac_dat_8     ({reg_file[dat_addr + 35], reg_file[dat_addr + 34], reg_file[dat_addr + 33], reg_file[dat_addr + 32]}),
    .mem2cmac_dat_9     ({reg_file[dat_addr + 39], reg_file[dat_addr + 38], reg_file[dat_addr + 37], reg_file[dat_addr + 36]}),
    .mem2cmac_dat_10    ({reg_file[dat_addr + 43], reg_file[dat_addr + 42], reg_file[dat_addr + 41], reg_file[dat_addr + 40]}),
    .mem2cmac_dat_11    ({reg_file[dat_addr + 47], reg_file[dat_addr + 46], reg_file[dat_addr + 45], reg_file[dat_addr + 44]}),
    .mem2cmac_dat_12    ({reg_file[dat_addr + 51], reg_file[dat_addr + 50], reg_file[dat_addr + 49], reg_file[dat_addr + 48]}),
    .mem2cmac_dat_13    ({reg_file[dat_addr + 55], reg_file[dat_addr + 54], reg_file[dat_addr + 53], reg_file[dat_addr + 52]}),
    .mem2cmac_dat_14    ({reg_file[dat_addr + 59], reg_file[dat_addr + 58], reg_file[dat_addr + 57], reg_file[dat_addr + 56]}),
    .mem2cmac_dat_15    ({reg_file[dat_addr + 63], reg_file[dat_addr + 62], reg_file[dat_addr + 61], reg_file[dat_addr + 60]}),
    .mem2cmac_dat_16    ({reg_file[dat_addr + 67], reg_file[dat_addr + 66], reg_file[dat_addr + 65], reg_file[dat_addr + 64]}),
    .mem2cmac_dat_17    ({reg_file[dat_addr + 71], reg_file[dat_addr + 70], reg_file[dat_addr + 69], reg_file[dat_addr + 68]}),
    .mem2cmac_dat_18    ({reg_file[dat_addr + 75], reg_file[dat_addr + 74], reg_file[dat_addr + 73], reg_file[dat_addr + 72]}),
    .mem2cmac_dat_19    ({reg_file[dat_addr + 79], reg_file[dat_addr + 78], reg_file[dat_addr + 77], reg_file[dat_addr + 76]}),
    .mem2cmac_dat_20    ({reg_file[dat_addr + 83], reg_file[dat_addr + 82], reg_file[dat_addr + 81], reg_file[dat_addr + 80]}),
    .mem2cmac_dat_21    ({reg_file[dat_addr + 87], reg_file[dat_addr + 86], reg_file[dat_addr + 85], reg_file[dat_addr + 84]}),
    .mem2cmac_dat_22    ({reg_file[dat_addr + 91], reg_file[dat_addr + 90], reg_file[dat_addr + 89], reg_file[dat_addr + 88]}),
    .mem2cmac_dat_23    ({reg_file[dat_addr + 95], reg_file[dat_addr + 94], reg_file[dat_addr + 93], reg_file[dat_addr + 92]}),
    .mem2cmac_dat_24    ({reg_file[dat_addr + 99], reg_file[dat_addr + 98], reg_file[dat_addr + 97], reg_file[dat_addr + 96]}),
    .mem2cmac_dat_25    ({reg_file[dat_addr + 103], reg_file[dat_addr + 102], reg_file[dat_addr + 101], reg_file[dat_addr + 100]}),
    .mem2cmac_dat_26    ({reg_file[dat_addr + 107], reg_file[dat_addr + 106], reg_file[dat_addr + 105], reg_file[dat_addr + 104]}),
    .mem2cmac_dat_27    ({reg_file[dat_addr + 111], reg_file[dat_addr + 110], reg_file[dat_addr + 109], reg_file[dat_addr + 108]}),
    .mem2cmac_dat_28    ({reg_file[dat_addr + 115], reg_file[dat_addr + 114], reg_file[dat_addr + 113], reg_file[dat_addr + 112]}),
    .mem2cmac_dat_29    ({reg_file[dat_addr + 119], reg_file[dat_addr + 118], reg_file[dat_addr + 117], reg_file[dat_addr + 116]}),
    .mem2cmac_dat_30    ({reg_file[dat_addr + 123], reg_file[dat_addr + 122], reg_file[dat_addr + 121], reg_file[dat_addr + 120]}),
    .mem2cmac_dat_31    ({reg_file[dat_addr + 127], reg_file[dat_addr + 126], reg_file[dat_addr + 125], reg_file[dat_addr + 124]}),
    .mem2cmac_dat_32    ({reg_file[dat_addr + 131], reg_file[dat_addr + 130], reg_file[dat_addr + 129], reg_file[dat_addr + 128]}),
    .mem2cmac_dat_33    ({reg_file[dat_addr + 135], reg_file[dat_addr + 134], reg_file[dat_addr + 133], reg_file[dat_addr + 132]}),
    .mem2cmac_dat_34    ({reg_file[dat_addr + 139], reg_file[dat_addr + 138], reg_file[dat_addr + 137], reg_file[dat_addr + 136]}),
    .mem2cmac_dat_35    ({reg_file[dat_addr + 143], reg_file[dat_addr + 142], reg_file[dat_addr + 141], reg_file[dat_addr + 140]}),
    .mem2cmac_dat_36    ({reg_file[dat_addr + 147], reg_file[dat_addr + 146], reg_file[dat_addr + 145], reg_file[dat_addr + 144]}),
    .mem2cmac_dat_37    ({reg_file[dat_addr + 151], reg_file[dat_addr + 150], reg_file[dat_addr + 149], reg_file[dat_addr + 148]}),
    .mem2cmac_dat_38    ({reg_file[dat_addr + 155], reg_file[dat_addr + 154], reg_file[dat_addr + 153], reg_file[dat_addr + 152]}),
    .mem2cmac_dat_39    ({reg_file[dat_addr + 159], reg_file[dat_addr + 158], reg_file[dat_addr + 157], reg_file[dat_addr + 156]}),
    .mem2cmac_dat_40    ({reg_file[dat_addr + 163], reg_file[dat_addr + 162], reg_file[dat_addr + 161], reg_file[dat_addr + 160]}),
    .mem2cmac_dat_41    ({reg_file[dat_addr + 167], reg_file[dat_addr + 166], reg_file[dat_addr + 165], reg_file[dat_addr + 164]}),
    .mem2cmac_dat_42    ({reg_file[dat_addr + 171], reg_file[dat_addr + 170], reg_file[dat_addr + 169], reg_file[dat_addr + 168]}),
    .mem2cmac_dat_43    ({reg_file[dat_addr + 175], reg_file[dat_addr + 174], reg_file[dat_addr + 173], reg_file[dat_addr + 172]}),
    .mem2cmac_dat_44    ({reg_file[dat_addr + 179], reg_file[dat_addr + 178], reg_file[dat_addr + 177], reg_file[dat_addr + 176]}),
    .mem2cmac_dat_45    ({reg_file[dat_addr + 183], reg_file[dat_addr + 182], reg_file[dat_addr + 181], reg_file[dat_addr + 180]}),
    .mem2cmac_dat_46    ({reg_file[dat_addr + 187], reg_file[dat_addr + 186], reg_file[dat_addr + 185], reg_file[dat_addr + 184]}),
    .mem2cmac_dat_47    ({reg_file[dat_addr + 191], reg_file[dat_addr + 190], reg_file[dat_addr + 189], reg_file[dat_addr + 188]}),
    .mem2cmac_dat_48    ({reg_file[dat_addr + 195], reg_file[dat_addr + 194], reg_file[dat_addr + 193], reg_file[dat_addr + 192]}),
    .mem2cmac_dat_49    ({reg_file[dat_addr + 199], reg_file[dat_addr + 198], reg_file[dat_addr + 197], reg_file[dat_addr + 196]}),
    .mem2cmac_dat_50    ({reg_file[dat_addr + 203], reg_file[dat_addr + 202], reg_file[dat_addr + 201], reg_file[dat_addr + 200]}),
    .mem2cmac_dat_51    ({reg_file[dat_addr + 207], reg_file[dat_addr + 206], reg_file[dat_addr + 205], reg_file[dat_addr + 204]}),
    .mem2cmac_dat_52    ({reg_file[dat_addr + 211], reg_file[dat_addr + 210], reg_file[dat_addr + 209], reg_file[dat_addr + 208]}),
    .mem2cmac_dat_53    ({reg_file[dat_addr + 215], reg_file[dat_addr + 214], reg_file[dat_addr + 213], reg_file[dat_addr + 212]}),
    .mem2cmac_dat_54    ({reg_file[dat_addr + 219], reg_file[dat_addr + 218], reg_file[dat_addr + 217], reg_file[dat_addr + 216]}),
    .mem2cmac_dat_55    ({reg_file[dat_addr + 223], reg_file[dat_addr + 222], reg_file[dat_addr + 221], reg_file[dat_addr + 220]}),
    .mem2cmac_dat_56    ({reg_file[dat_addr + 227], reg_file[dat_addr + 226], reg_file[dat_addr + 225], reg_file[dat_addr + 224]}),
    .mem2cmac_dat_57    ({reg_file[dat_addr + 231], reg_file[dat_addr + 230], reg_file[dat_addr + 229], reg_file[dat_addr + 228]}),
    .mem2cmac_dat_58    ({reg_file[dat_addr + 235], reg_file[dat_addr + 234], reg_file[dat_addr + 233], reg_file[dat_addr + 232]}),
    .mem2cmac_dat_59    ({reg_file[dat_addr + 239], reg_file[dat_addr + 238], reg_file[dat_addr + 237], reg_file[dat_addr + 236]}),
    .mem2cmac_dat_60    ({reg_file[dat_addr + 243], reg_file[dat_addr + 242], reg_file[dat_addr + 241], reg_file[dat_addr + 240]}),
    .mem2cmac_dat_61    ({reg_file[dat_addr + 247], reg_file[dat_addr + 246], reg_file[dat_addr + 245], reg_file[dat_addr + 244]}),
    .mem2cmac_dat_62    ({reg_file[dat_addr + 251], reg_file[dat_addr + 250], reg_file[dat_addr + 249], reg_file[dat_addr + 248]}),
    .mem2cmac_dat_63    ({reg_file[dat_addr + 255], reg_file[dat_addr + 254], reg_file[dat_addr + 253], reg_file[dat_addr + 252]}),
    .mem2cmac_dat_size  (size),
    .mem2cmac_wt_0     ({reg_file[wt_addr + 3], reg_file[wt_addr + 2], reg_file[wt_addr + 1], reg_file[wt_addr + 0]}),
    .mem2cmac_wt_1     ({reg_file[wt_addr + 7], reg_file[wt_addr + 6], reg_file[wt_addr + 5], reg_file[wt_addr + 4]}),
    .mem2cmac_wt_2     ({reg_file[wt_addr + 11], reg_file[wt_addr + 10], reg_file[wt_addr + 9], reg_file[wt_addr + 8]}),
    .mem2cmac_wt_3     ({reg_file[wt_addr + 15], reg_file[wt_addr + 14], reg_file[wt_addr + 13], reg_file[wt_addr + 12]}),
    .mem2cmac_wt_4     ({reg_file[wt_addr + 19], reg_file[wt_addr + 18], reg_file[wt_addr + 17], reg_file[wt_addr + 16]}),
    .mem2cmac_wt_5     ({reg_file[wt_addr + 23], reg_file[wt_addr + 22], reg_file[wt_addr + 21], reg_file[wt_addr + 20]}),
    .mem2cmac_wt_6     ({reg_file[wt_addr + 27], reg_file[wt_addr + 26], reg_file[wt_addr + 25], reg_file[wt_addr + 24]}),
    .mem2cmac_wt_7     ({reg_file[wt_addr + 31], reg_file[wt_addr + 30], reg_file[wt_addr + 29], reg_file[wt_addr + 28]}),
    .mem2cmac_wt_8     ({reg_file[wt_addr + 35], reg_file[wt_addr + 34], reg_file[wt_addr + 33], reg_file[wt_addr + 32]}),
    .mem2cmac_wt_9     ({reg_file[wt_addr + 39], reg_file[wt_addr + 38], reg_file[wt_addr + 37], reg_file[wt_addr + 36]}),
    .mem2cmac_wt_10     ({reg_file[wt_addr + 43], reg_file[wt_addr + 42], reg_file[wt_addr + 41], reg_file[wt_addr + 40]}),
    .mem2cmac_wt_11     ({reg_file[wt_addr + 47], reg_file[wt_addr + 46], reg_file[wt_addr + 45], reg_file[wt_addr + 44]}),
    .mem2cmac_wt_12     ({reg_file[wt_addr + 51], reg_file[wt_addr + 50], reg_file[wt_addr + 49], reg_file[wt_addr + 48]}),
    .mem2cmac_wt_13     ({reg_file[wt_addr + 55], reg_file[wt_addr + 54], reg_file[wt_addr + 53], reg_file[wt_addr + 52]}),
    .mem2cmac_wt_14     ({reg_file[wt_addr + 59], reg_file[wt_addr + 58], reg_file[wt_addr + 57], reg_file[wt_addr + 56]}),
    .mem2cmac_wt_15     ({reg_file[wt_addr + 63], reg_file[wt_addr + 62], reg_file[wt_addr + 61], reg_file[wt_addr + 60]}),
    .mem2cmac_wt_16     ({reg_file[wt_addr + 67], reg_file[wt_addr + 66], reg_file[wt_addr + 65], reg_file[wt_addr + 64]}),
    .mem2cmac_wt_17     ({reg_file[wt_addr + 71], reg_file[wt_addr + 70], reg_file[wt_addr + 69], reg_file[wt_addr + 68]}),
    .mem2cmac_wt_18     ({reg_file[wt_addr + 75], reg_file[wt_addr + 74], reg_file[wt_addr + 73], reg_file[wt_addr + 72]}),
    .mem2cmac_wt_19     ({reg_file[wt_addr + 79], reg_file[wt_addr + 78], reg_file[wt_addr + 77], reg_file[wt_addr + 76]}),
    .mem2cmac_wt_20     ({reg_file[wt_addr + 83], reg_file[wt_addr + 82], reg_file[wt_addr + 81], reg_file[wt_addr + 80]}),
    .mem2cmac_wt_21     ({reg_file[wt_addr + 87], reg_file[wt_addr + 86], reg_file[wt_addr + 85], reg_file[wt_addr + 84]}),
    .mem2cmac_wt_22     ({reg_file[wt_addr + 91], reg_file[wt_addr + 90], reg_file[wt_addr + 89], reg_file[wt_addr + 88]}),
    .mem2cmac_wt_23     ({reg_file[wt_addr + 95], reg_file[wt_addr + 94], reg_file[wt_addr + 93], reg_file[wt_addr + 92]}),
    .mem2cmac_wt_24     ({reg_file[wt_addr + 99], reg_file[wt_addr + 98], reg_file[wt_addr + 97], reg_file[wt_addr + 96]}),
    .mem2cmac_wt_25     ({reg_file[wt_addr + 103], reg_file[wt_addr + 102], reg_file[wt_addr + 101], reg_file[wt_addr + 100]}),
    .mem2cmac_wt_26     ({reg_file[wt_addr + 107], reg_file[wt_addr + 106], reg_file[wt_addr + 105], reg_file[wt_addr + 104]}),
    .mem2cmac_wt_27     ({reg_file[wt_addr + 111], reg_file[wt_addr + 110], reg_file[wt_addr + 109], reg_file[wt_addr + 108]}),
    .mem2cmac_wt_28     ({reg_file[wt_addr + 115], reg_file[wt_addr + 114], reg_file[wt_addr + 113], reg_file[wt_addr + 112]}),
    .mem2cmac_wt_29     ({reg_file[wt_addr + 119], reg_file[wt_addr + 118], reg_file[wt_addr + 117], reg_file[wt_addr + 116]}),
    .mem2cmac_wt_30     ({reg_file[wt_addr + 123], reg_file[wt_addr + 122], reg_file[wt_addr + 121], reg_file[wt_addr + 120]}),
    .mem2cmac_wt_31     ({reg_file[wt_addr + 127], reg_file[wt_addr + 126], reg_file[wt_addr + 125], reg_file[wt_addr + 124]}),
    .mem2cmac_wt_32     ({reg_file[wt_addr + 131], reg_file[wt_addr + 130], reg_file[wt_addr + 129], reg_file[wt_addr + 128]}),
    .mem2cmac_wt_33     ({reg_file[wt_addr + 135], reg_file[wt_addr + 134], reg_file[wt_addr + 133], reg_file[wt_addr + 132]}),
    .mem2cmac_wt_34     ({reg_file[wt_addr + 139], reg_file[wt_addr + 138], reg_file[wt_addr + 137], reg_file[wt_addr + 136]}),
    .mem2cmac_wt_35     ({reg_file[wt_addr + 143], reg_file[wt_addr + 142], reg_file[wt_addr + 141], reg_file[wt_addr + 140]}),
    .mem2cmac_wt_36     ({reg_file[wt_addr + 147], reg_file[wt_addr + 146], reg_file[wt_addr + 145], reg_file[wt_addr + 144]}),
    .mem2cmac_wt_37     ({reg_file[wt_addr + 151], reg_file[wt_addr + 150], reg_file[wt_addr + 149], reg_file[wt_addr + 148]}),
    .mem2cmac_wt_38     ({reg_file[wt_addr + 155], reg_file[wt_addr + 154], reg_file[wt_addr + 153], reg_file[wt_addr + 152]}),
    .mem2cmac_wt_39     ({reg_file[wt_addr + 159], reg_file[wt_addr + 158], reg_file[wt_addr + 157], reg_file[wt_addr + 156]}),
    .mem2cmac_wt_40     ({reg_file[wt_addr + 163], reg_file[wt_addr + 162], reg_file[wt_addr + 161], reg_file[wt_addr + 160]}),
    .mem2cmac_wt_41     ({reg_file[wt_addr + 167], reg_file[wt_addr + 166], reg_file[wt_addr + 165], reg_file[wt_addr + 164]}),
    .mem2cmac_wt_42     ({reg_file[wt_addr + 171], reg_file[wt_addr + 170], reg_file[wt_addr + 169], reg_file[wt_addr + 168]}),
    .mem2cmac_wt_43     ({reg_file[wt_addr + 175], reg_file[wt_addr + 174], reg_file[wt_addr + 173], reg_file[wt_addr + 172]}),
    .mem2cmac_wt_44     ({reg_file[wt_addr + 179], reg_file[wt_addr + 178], reg_file[wt_addr + 177], reg_file[wt_addr + 176]}),
    .mem2cmac_wt_45     ({reg_file[wt_addr + 183], reg_file[wt_addr + 182], reg_file[wt_addr + 181], reg_file[wt_addr + 180]}),
    .mem2cmac_wt_46     ({reg_file[wt_addr + 187], reg_file[wt_addr + 186], reg_file[wt_addr + 185], reg_file[wt_addr + 184]}),
    .mem2cmac_wt_47     ({reg_file[wt_addr + 191], reg_file[wt_addr + 190], reg_file[wt_addr + 189], reg_file[wt_addr + 188]}),
    .mem2cmac_wt_48     ({reg_file[wt_addr + 195], reg_file[wt_addr + 194], reg_file[wt_addr + 193], reg_file[wt_addr + 192]}),
    .mem2cmac_wt_49     ({reg_file[wt_addr + 199], reg_file[wt_addr + 198], reg_file[wt_addr + 197], reg_file[wt_addr + 196]}),
    .mem2cmac_wt_50     ({reg_file[wt_addr + 203], reg_file[wt_addr + 202], reg_file[wt_addr + 201], reg_file[wt_addr + 200]}),
    .mem2cmac_wt_51     ({reg_file[wt_addr + 207], reg_file[wt_addr + 206], reg_file[wt_addr + 205], reg_file[wt_addr + 204]}),
    .mem2cmac_wt_52     ({reg_file[wt_addr + 211], reg_file[wt_addr + 210], reg_file[wt_addr + 209], reg_file[wt_addr + 208]}),
    .mem2cmac_wt_53     ({reg_file[wt_addr + 215], reg_file[wt_addr + 214], reg_file[wt_addr + 213], reg_file[wt_addr + 212]}),
    .mem2cmac_wt_54     ({reg_file[wt_addr + 219], reg_file[wt_addr + 218], reg_file[wt_addr + 217], reg_file[wt_addr + 216]}),
    .mem2cmac_wt_55     ({reg_file[wt_addr + 223], reg_file[wt_addr + 222], reg_file[wt_addr + 221], reg_file[wt_addr + 220]}),
    .mem2cmac_wt_56     ({reg_file[wt_addr + 227], reg_file[wt_addr + 226], reg_file[wt_addr + 225], reg_file[wt_addr + 224]}),
    .mem2cmac_wt_57     ({reg_file[wt_addr + 231], reg_file[wt_addr + 230], reg_file[wt_addr + 229], reg_file[wt_addr + 228]}),
    .mem2cmac_wt_58     ({reg_file[wt_addr + 235], reg_file[wt_addr + 234], reg_file[wt_addr + 233], reg_file[wt_addr + 232]}),
    .mem2cmac_wt_59     ({reg_file[wt_addr + 239], reg_file[wt_addr + 238], reg_file[wt_addr + 237], reg_file[wt_addr + 236]}),
    .mem2cmac_wt_60     ({reg_file[wt_addr + 243], reg_file[wt_addr + 242], reg_file[wt_addr + 241], reg_file[wt_addr + 240]}),
    .mem2cmac_wt_61     ({reg_file[wt_addr + 247], reg_file[wt_addr + 246], reg_file[wt_addr + 245], reg_file[wt_addr + 244]}),
    .mem2cmac_wt_62     ({reg_file[wt_addr + 251], reg_file[wt_addr + 250], reg_file[wt_addr + 249], reg_file[wt_addr + 248]}),
    .mem2cmac_wt_63     ({reg_file[wt_addr + 255], reg_file[wt_addr + 254], reg_file[wt_addr + 253], reg_file[wt_addr + 252]}),
    .cmac2mem_result    (result),
    .cmac2mem_valid     (res_vld)
    );
endmodule
