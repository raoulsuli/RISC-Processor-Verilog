`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 01:07:27 PM
// Design Name: 
// Module Name: top_design
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


module top_design(in, clk, reset, out);

    input [23:0] in;
    input clk, reset;
    output [3:0] out;
    
    wire [23:0] w1;
    wire [3:0] w2, w3, w4;//, w10;
    wire [11:0] w5, w6, w8, w9;
    wire [7:0] w7;
    
    //primul front pozitiv al ceasului
    register first_instruction(in, clk, reset, w1);
    
    // a/b
    div div1(w2, w1[23:20], w1[19:16]);
    
    // c/d
    div div2(w3, w1[15:12], w1[11:8]);
    
    // e/f
    div div3(w4, w1[7:4], w1[3:0]);
   
    assign w5 = {w2, w3, w4};
    
    //al doilea
    register second_instruction(w5, clk, reset, w6);
    
    // (a/b) * (c/d)
    multiply mul1(w7, w6[11:8], w6[7:4]);
    
    //al treilea
    
    assign w8 = {w7, w6[3:0]};
    register third_instruction(w8, clk, reset, w9);
    
    // [(a/b) * (c/d)] - (e/f)
    substract sub1(out, w9[11:4], w9[3:0]);
    
//    assign out = w10;
endmodule
