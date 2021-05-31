`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 01:05:13 PM
// Design Name: 
// Module Name: register
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


module register(inputs, clk, reset, outputs);
    
    input [23:0] inputs;
    input clk, reset;
    output reg [23:0] outputs;
    
    always @(posedge clk or posedge reset)
        if (reset == 1)
            outputs = 0;
        else
            outputs = inputs;
endmodule
