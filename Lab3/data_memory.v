`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2021 06:08:10 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk,       
                   input mem_read,
                   input mem_write,
                   input [31:0] address,
                   input [31:0] write_data,
                   output reg [31:0] read_data
                   );
    
    reg [31:0] memory[0:1023];
    
    always @(*) begin
        if (mem_read) begin
            read_data = memory[address];
        end
    end
    
    always @(posedge clk) begin
        if (mem_write) begin
            memory[address] = write_data;
        end
    end
endmodule
