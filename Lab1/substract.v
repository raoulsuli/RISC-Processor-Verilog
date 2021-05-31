`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 01:03:40 PM
// Design Name: 
// Module Name: substract
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


module substract(
    output reg [3:0] out,
    input [3:0] in1,
    input [3:0] in2
    );
    
    always @(in1, in2)
        out = in1 - in2;

endmodule
