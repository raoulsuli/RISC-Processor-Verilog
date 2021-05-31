`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2020 07:28:27 PM
// Design Name: 
// Module Name: mux_4_to_1
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


module mux_4_to_1(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [1:0] sel,
    output reg [31:0] out
    );
    
    always @(sel or in0 or in1 or in2) begin
        case (sel)
            0: out = in0;
            1: out = in1;
            2: out = in2;
        endcase
    end
    
endmodule
