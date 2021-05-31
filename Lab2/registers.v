`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2020 09:36:10 PM
// Design Name: 
// Module Name: registers
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


module registers(
    input clk,
    input reg_write,
    input[4:0] read_reg1,
    input[4:0] read_reg2,
    input[4:0] write_reg,
    input[31:0] write_data,
    output[31:0] read_data1,
    output[31:0] read_data2 
    );
    
    reg[31:0] registers[31:0];
    integer i;
    
    initial begin
        for(i = 0; i < 31; i = i + 1)
        begin
            registers[i] = i;
        end
    end

    always @(posedge clk)
    begin
        if (reg_write)
        begin
            registers[write_reg] = write_data;
        end
    end
        
    always @(read_reg1 or read_reg2)
    begin
        registers[read_reg1] = read_data1;
        registers[read_reg2] = read_data2;
    end

endmodule
