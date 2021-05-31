`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2020 01:51:35 PM
// Design Name: 
// Module Name: topDesign_test
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


module topDesign_test;

    reg [3:0] a;
    reg [3:0] b;
    reg [3:0] c;
    reg [3:0] d;
    reg [3:0] e;
    reg [3:0] f;
    
    wire [3:0] out;
    reg clk, reset;
    
    reg [23:0] inputs;
    
    top_design test(inputs, clk, reset, out);
    
    always begin 
        #5 clk = ~clk;
    end
    
    initial
    begin
        
        #100
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        e = 0;
        f = 0;
        clk = 0;
        reset = 0;
        
        #150
        a = 6;
        b = 2;
        c = 12;
        d = 3;
        e = 5;
        f = 1;
        
        #200
        reset = 1;
    end
endmodule
