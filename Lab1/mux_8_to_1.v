`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 11:04:27 AM
// Design Name: 
// Module Name: mux_8_to_1
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


module mux_8_to_1(
    output out,
    input in0,
    input in1,
    input in2,
    input in3,
    input in4,
    input in5,
    input in6,
    input in7,
    input sel0,
    input sel1,
    input sel2
    );
    
    wire notsel0, notsel1, notsel2;
    wire y0, y1, y2, y3, y4, y5, y6, y7;
    
    not(notsel0, sel0);
    not(notsel1, sel1);
    not(notsel2, sel2);
    
    and(y0, in0, notsel2, notsel1, notsel0);
    and(y1, in1, notsel2, notsel1, sel0);
    and(y2, in2, notsel2, sel1, notsel0);
    and(y3, in3, notsel2, sel1, sel0);
    and(y4, in4, sel2, notsel1, notsel0);
    and(y5, in5, sel2, notsel1, sel0);
    and(y6, in6, sel2, sel1, notsel0);
    and(y7, in7, sel2, sel1, sel0);

    or(out, y0, y1, y2, y3, y4, y5, y6, y7);

endmodule
