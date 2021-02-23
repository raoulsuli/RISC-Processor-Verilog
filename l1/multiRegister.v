`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 11:47:18 AM
// Design Name: 
// Module Name: multiRegister
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


module multiRegister(
    output reg [3:0] out,
    input [3:0] in,
    input clk,
    input en, 
    input reset, 
    input inc, 
    input dec, 
    input shl, 
    input shr
    );
    
    always @(posedge clk or posedge reset)
    begin
        if (reset == 1)
            out = 0;
        else
            if (en == 1)
                out = in;
            if(inc == 1)
                out = out + 1;
            if (dec == 1)
                out = out - 1;
            if (shl == 1)
                out = out << 1;
            if (shr == 1)
                out = out >> 1;       
    end
              
endmodule
