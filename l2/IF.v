`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 10:52:19 PM
// Design Name: 
// Module Name: IF
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


module IF(
    input clk,
    input reset,
    input PCSrc,
    input PC_write,
    input [31:0] PC_Branch,
    output [31:0] PC_IF,
    output [31:0] INSTRUCTION_IF
    );
    
    wire [31:0] PC_Adder_Out, mux_out, PCOut;
    
    mux2_1 mux1(PC_Adder_Out, PC_Branch, PCSrc, mux_out); 
    PC PC1(mux_out, clk, reset, PC_write, PCOut);
    adder adder1(PCOut, 4, PC_Adder_Out);
    instruction_memory mem(PCOut >> 2, INSTRUCTION_IF);
    
    assign PC_IF = PCOut;
endmodule
