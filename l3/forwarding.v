`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/06/2021 11:43:59 PM
// Design Name: 
// Module Name: forwarding
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


module forwarding(input [4:0] rs1,
                  input [4:0] rs2,
                  input [4:0] ex_mem_rd,
                  input [4:0] mem_wb_rd,
                  input ex_mem_regwrite,
                  input mem_wb_regwrite,
                  output reg [1:0] forwardA,forwardB);
                  
    always @(*) begin
        if (ex_mem_regwrite && ex_mem_rd != 0) begin
            if (ex_mem_rd == rs1) begin
                forwardA[1] = 1;
                forwardA[0] = 0;
            end
            if (ex_mem_rd == rs2) begin
                forwardB[1] = 1;
                forwardB[0] = 0;
            end
        end
        
        if (mem_wb_regwrite && mem_wb_rd != 0 && !(ex_mem_regwrite && ex_mem_rd != 0)) begin
            if (!(ex_mem_rd == rs1) && mem_wb_rd == rs1) begin
                forwardA[1] = 0;
                forwardA[0] = 1;
            end
            if (!(ex_mem_rd == rs2) && mem_wb_rd == rs2) begin
                forwardB[1] = 0;
                forwardB[0] = 1;
            end
        end
        else begin
            forwardA = 0;
            forwardB = 0;
        end
    end
endmodule
