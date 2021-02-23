`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2020 01:07:21 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);
    
    always @(*) begin
        ALUinput[3:0] = 0;
        case (ALUop)
            0: begin // I,S
                if (funct3 == 3) begin
                    ALUinput[1] = 1; // LD, SD
                end
            end
            1: begin // B
                if (funct3 == 0 || funct3 == 1) begin
                    ALUinput[2] = 1;
                    ALUinput[1] = 1; // BEQ, BNE
                end
                if (funct3 == 4 || funct3 == 5) begin
                    ALUinput[3] = 1; // BLT, BGE
                end
                if (funct3 ==  6|| funct3 == 7) begin
                    ALUinput[2] = 1;
                    ALUinput[1] = 1;
                    ALUinput[0] = 1; // BLTU, BGEU
                end
            end
            2: begin // R, funct7
                if (funct3 == 0 && funct7 == 0) begin
                    ALUinput[1] = 1; // ADD
                end
                if (funct3 == 0 && funct7 == 32) begin
                    ALUinput[2] = 1;
                    ALUinput[1] = 1;
                end
                if (funct3 == 7 && funct7 == 0) begin
                    ALUinput = 0; // AND
                end
                if (funct3 == 6 && funct7 == 0) begin
                    ALUinput[0] = 1; // OR
                end
                if (funct3 == 4 && funct7 == 0) begin
                    ALUinput[1] = 1;
                    ALUinput[0] = 1; // XOR
                end
                if (funct3 == 5 && funct7 == 0) begin
                    ALUinput[2] = 1;
                    ALUinput[0] = 1; // SRL, SRLI
                end
                if (funct3 == 1 && funct7 == 0) begin
                    ALUinput[2] = 1; // SLL, SLLI
                end
                if (funct3 == 6 && funct7 == 32) begin
                    ALUinput[3] = 1;
                    ALUinput[0] = 1; //SRA, SRAI
                end
                if (funct3 == 3 && funct7 == 0) begin
                    ALUinput[2] = 1;
                    ALUinput[1] = 1;
                    ALUinput[0] = 1; // SLTU
                end
                if (funct3 == 2 && funct7 == 0) begin
                    ALUinput[3] = 1; // SLT
                end
            end
        endcase
    end
endmodule
