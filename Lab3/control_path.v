`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2020 10:44:16 AM
// Design Name: 
// Module Name: control_path
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


module control_path(input [6:0] opcode, //opcode instruct
                    input control_sel, //semnal provenit din unitatea de detectie hazard
                    output reg MemRead,MemtoReg,MemWrite,RegWrite,Branch,ALUSrc, //semnale control
                    output reg [1:0] ALUop); //semnal control ALU

//always @(posedge control_sel) begin
//    MemRead = 0;
//    MemtoReg = 0;
//    MemWrite = 0;
//    RegWrite = 0;
//    Branch = 0;
//    ALUSrc = 0;
//    ALUop[1:0] = 0;
//end

always@(opcode,control_sel) begin
    casex({control_sel,opcode})
      8'b1xxxxxxx: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00000000; //nop from hazard unit
      8'b00000000: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00000000; //nop from ISA
      8'b00000011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b11110000; //lw
      8'b00100011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b10001000; //sw
      8'b00110011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00100010; //R32-format
      8'b00010011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b10100011; //Register32-Immediate Arithmetic Instructions
      8'b01100011: {ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUop} <= 8'b00000101; //branch instructions
    endcase
  end
  
endmodule
