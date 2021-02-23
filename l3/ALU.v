`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2020 02:33:02 PM
// Design Name: 
// Module Name: ALU
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


module ALU(input [3:0] ALUop, //ALUinput ce selecteaza operatia
           input [31:0] ina,inb, //operanzii ce iau parte la operatie
           output zero, //semnal ce verifica daca rezultatul este 0
           output reg [31:0] out); //rezultatul operatiei
    
    reg sign;
    always @(*) begin
        case (ALUop)
            0: out = ina & inb;
            1: out = ina | inb;
            2: out = ina + inb;
            3: out = ina ^ inb;
            4: out = ina << inb; // sll
            5: out = ina >> inb; // srl
            6: out = ina - inb;
            7: out = (ina < inb) ? 1 : 0; // sltu
            8: out = ($signed(ina) < $signed(inb)) ? 1 : 0; // slt
            9: out = ina >>> inb; // sra
        endcase
    end
    
    assign zero = (out == 0) ? 1 : 0;
    
endmodule