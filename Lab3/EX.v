`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2020 17:18:16 AM
// Design Name: 
// Module Name: EX
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


module EX(input [31:0] IMM_EX, // valoarea immediate in EX
          input [31:0] REG_DATA1_EX, // valoare registru sursa 1
          input [31:0] REG_DATA2_EX, // valoare registru sursa 2
          input [31:0] PC_EX, // adresa instructiunii curente in EX
          input [2:0] FUNCT3_EX, // funct3 pentru instructiunea din EX
          input [6:0] FUNCT7_EX, // funct7 pentru instructiunea din EX
          input [4:0] RD_EX, // adresa registrului destinatie
          input [4:0] RS1_EX, //  adresa registrului sursa 1
          input [4:0] RS2_EX, //adresa registrului sursa 2
          input RegWrite_EX, //semnal de scriere in bancul de registri
          input MemtoReg_EX,
          input MemRead_EX, //semnal pentru activarea citirii din memorie
          input MemWrite_EX, //semnal pentru activarea scrierii in memorie
          input [1:0] ALUop_EX, // semnal de control ALUop
          input ALUSrc_EX, //semnal de selectie intre RS2 si valoarea imediata
          input Branch_EX, // semnal de identificare a instructiunilor de tip branch
          input [1:0] forwardA,forwardB, //semnale de selectie pentru multiplexoarele de forwarding
          
          input [31:0] ALU_DATA_WB, //valoarea calculata de ALU, prezenta in WB
          input [31:0] ALU_OUT_MEM, //..., prezenta in MEM
          
          output ZERO_EX, // flag-ul ZERO calculat de ALU
          output [31:0] ALU_OUT_EX, //rezultatul calculat de ALU in EX
          output [31:0] PC_Branch_EX, //adresa de salt calculata in EX
          output [31:0] REG_DATA2_EX_FINAL //valoarea registrului sursa 2 selectata dintre
          );                                // valorile prezente in etapele EX, MEM, WB
    
    wire [31:0] mux_out_1, mux_out_2, mux_out_3;
    wire [3:0] ALUop;
    
    mux_4_to_1 mux1(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardA, mux_out_1);
    mux_4_to_1 mux2(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, 0, forwardB, mux_out_2);
    
    mux2_1 mux3(mux_out_2, IMM_EX, ALUSrc_EX, mux_out_3);
    
    ALUcontrol ALUcontrol(ALUop_EX, FUNCT7_EX, FUNCT3_EX, ALUop);

    ALU ALU(ALUop, mux_out_1, mux_out_3, ZERO_EX, ALU_OUT_EX);
    
    adder adder(IMM_EX, PC_EX, PC_Branch_EX);
      
endmodule
