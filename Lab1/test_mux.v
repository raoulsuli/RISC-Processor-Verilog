`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 11:21:52 AM
// Design Name: 
// Module Name: test_mux
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


module test_mux;
    
    reg in0, in1, in2, in3, in4, in5, in6, in7;
    reg sel0, sel1, sel2;
    
    wire out;
    
    mux_8_to_1 test(out, in0, in1, in2, in3, in4, in5, in6, in7, sel0, sel1, sel2);
    
    initial begin
    
        in0 = 0;
        in1 = 0;
        in2 = 0;
        in3 = 0;
        in4 = 0;
        in5 = 0;
        in6 = 0; 
        in7 = 0;
        sel0 = 0;
        sel1 = 0;
        sel2 = 0;
        
        #100;
        
        in0 = 1;
        
        #100;
        
        in0 = 0;
        in1 = 1;
        sel0 = 1;
        
        #100;
        in1 = 0;
        in2 = 1;
        sel0 = 0;
        sel1 = 1;
        
        #100;
        in2 = 0;
        in3 = 1;
        sel0 = 1;
        
        #100
        in3 = 0;
        in4 = 1;
        sel0 = 0;
        sel1 = 0;
        sel2 = 1;
        
        #100
        in4 = 0;
        in5 = 1;
        sel0 = 1;
        
        #100
        in5 = 0;
        in6 = 1;
        sel0 = 0;
        sel1 = 1;
        
        #100
        in6 = 0;
        in7 = 1;
        sel0 = 1;
        
        end

endmodule
