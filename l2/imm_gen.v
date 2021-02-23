`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2020 01:39:39 PM
// Design Name: 
// Module Name: imm_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module imm_gen(
    input[31:0] in,
    output reg[31:0] out
    );
    
    always @(in)
    begin
        case (in[7:0] + in[14:12])
            5: begin //LW //I-TYPE
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20];
               end
            19: begin //ADDI
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20];            
                end
            26: begin //ANDI
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20];  
                end
            25: begin //ORI
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20]; 
                end
            23: begin //XORI
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20];
                end
            21: begin //SLTI
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20]; 
                end
            22: begin //SLTIU
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20]; 
                end
            24: begin //SRLI/SRAI
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20]; 
                end
            20: begin //SLLI
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[24:21];
                    out[0] = in[20]; 
                end
            37: begin //SW S-TYPE
                    out[31:10] = in[31];
                    out[10:5] = in[30:25];
                    out[4:1] = in[11:8];
                    out[0] = in[7]; 
                end
            99: begin //BEQ B-TYPE
                    out[31:12] = in[31];
                    out[12:10] = in[7];
                    out[10:5] = in[30:25];
                    out[4:1] = in[11:8];
                    out[0] = 0; 
                end
            100: begin //BNE
                    out[31:12] = in[31];
                    out[12:10] = in[7];
                    out[10:5] = in[30:25];
                    out[4:1] = in[11:8];
                    out[0] = 0; 
                 end
            103: begin //BLT
                    out[31:12] = in[31];
                    out[12:10] = in[7];
                    out[10:5] = in[30:25];
                    out[4:1] = in[11:8];
                    out[0] = 0; 
                 end
            104: begin //BGE
                    out[31:12] = in[31];
                    out[12:10] = in[7];
                    out[10:5] = in[30:25];
                    out[4:1] = in[11:8];
                    out[0] = 0; 
                 end
            105: begin //BLTU
                    out[31:12] = in[31];
                    out[12:10] = in[7];
                    out[10:5] = in[30:25];
                    out[4:1] = in[11:8];
                    out[0] = 0; 
                 end
            106: begin //BGEU
                    out[31:12] = in[31];
                    out[12:10] = in[7];
                    out[10:5] = in[30:25];
                    out[4:1] = in[11:8];
                    out[0] = 0; 
                 end
        endcase         
    end
    
endmodule
