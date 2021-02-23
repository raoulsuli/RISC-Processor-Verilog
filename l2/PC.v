`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2020 08:41:25 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] in,
    input clk,
    input res,
    input write,
    output reg [31:0] out
    );
    
    always @(posedge clk or posedge res)
        if (res) begin
            out = 0;
        end
        else if (write) begin
            out = in;
        end
endmodule
