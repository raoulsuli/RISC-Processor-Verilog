`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2020 09:11:19 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input clk,
    input reset,
    input reg_write,
    input[63:0] instruction_in,
    output reg[63:0] instruction_out
    );
    
    always @(posedge clk or posedge reset)
    begin
        if (reset) begin
            instruction_out = 0;
        end
        if (reg_write) begin
            instruction_out = instruction_in;
        end
    end
endmodule
