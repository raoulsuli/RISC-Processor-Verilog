`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2021 02:55:01 PM
// Design Name: 
// Module Name: EX_MEM_reg
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


module EX_MEM_reg(
        input clk, reset, write,
        input RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX,Branch_EX,
        input [31:0] PC_Branch,
        input [2:0] FUNCT3_EX,
        input [31:0] ALU_OUT_EX,
        input ZERO_EX,
        input [31:0] MUX_B_EX,
        input [4:0] RS2_EX,RD_EX,
        output reg RegWrite_MEM,MemtoReg_MEM,MemRead_MEM,MemWrite_MEM,Branch_MEM,
        output reg [31:0] PC_MEM,
        output reg [2:0] FUNCT3_MEM,
        output reg [31:0] ALU_OUT_MEM,
        output reg ZERO_MEM,
        output reg [31:0] REG_DATA2_MEM,
        output reg [4:0] RS2_MEM,RD_MEM
    );
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            RegWrite_MEM = 0;
            MemtoReg_MEM = 0;
            MemRead_MEM = 0;
            MemWrite_MEM = 0;
            Branch_MEM = 0;
            PC_MEM = 0;
            FUNCT3_MEM = 0;
            ALU_OUT_MEM = 0;
            ZERO_MEM = 0;
            REG_DATA2_MEM = 0;
            RS2_MEM = 0;
            RD_MEM = 0;
        end
        if (write) begin
            RegWrite_MEM = RegWrite_EX;
            MemtoReg_MEM = MemtoReg_EX;
            MemRead_MEM = MemRead_EX;
            MemWrite_MEM = MemWrite_EX;
            Branch_MEM = Branch_EX;
            PC_MEM = PC_Branch;
            FUNCT3_MEM = FUNCT3_EX;
            ALU_OUT_MEM = ALU_OUT_EX;
            ZERO_MEM = ZERO_EX;
            REG_DATA2_MEM = MUX_B_EX;
            RS2_MEM = RS2_EX;
            RD_MEM = RD_EX;
        end
    end
endmodule
