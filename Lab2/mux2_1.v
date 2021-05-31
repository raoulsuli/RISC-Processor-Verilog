`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2020 08:36:25 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(
    input [31:0] ina,
    input [31:0] inb,
    input sel,
    output [32:0] out);
    
    wire notsel;
    wire[31:0] y0, y1;
    genvar i;
    
    not(notsel, sel);
    
    for(i = 0; i < 31; i = i + 1) begin
        and(y0[i], ina[i], notsel);
        and(y1[i], inb[i], sel);
    end
    
    for(i = 0; i < 31; i = i + 1) begin
        or(out[i], y0[i], y1[i]);
    end    

endmodule
