`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2020 08:55:23 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [9:0] address,
    output reg [31:0] instruction
    );
    
    reg [6:0] memory[31:0]; // 7 entries of 32 bits
    
    initial begin
        $readmemh("code.mem", memory);
        instruction = memory[address];
    end

endmodule
