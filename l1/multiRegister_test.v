`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 06:39:17 PM
// Design Name: 
// Module Name: multiRegister_test
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


module multiRegister_test;

    wire [3:0] out;
    reg [3:0] in;
    reg clk, en, reset, inc, dec, shl, shr;
    
    multiRegister test(out, in, clk, en, reset, inc, dec, shl, shr);
    
    always begin
        #5 clk = ~clk;
    end
    
    initial 
    begin
    
        clk = 0;
        in = 0;
        en = 0;
        reset = 0;
        inc = 0;
        dec = 0;
        shl = 0;
        shr = 0;
        
        #200
        in = 5;
        en = 1;
        
        #250
        inc = 1;    
        
        #200
        reset = 1;
        en = 0;
        inc = 0;
        
        #200
        reset = 0;
        in = 12;
        en = 1;
        shl = 1;
        
        #250
        inc = 1;
        
        #250
        inc = 0;
        shl = 0;
        dec = 1;
        shr = 1;      
    end

endmodule
