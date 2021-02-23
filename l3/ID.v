module ID(input clk,
          input [31:0] PC_ID,INSTRUCTION_ID,
          input RegWrite_WB, 
          input [31:0] ALU_DATA_WB,
          input [4:0] RD_WB,
          input pipeline_stall,
          output [31:0] IMM_ID,
          output [31:0] REG_DATA1_ID,REG_DATA2_ID,
          output [2:0] FUNCT3_ID,
          output [6:0] FUNCT7_ID,
          output [6:0] OPCODE_ID,
          output [4:0] RD_ID,
          output [4:0] RS1_ID,
          output [4:0] RS2_ID,
          output RegWrite_ID,  //semnal pentru scrierea in bancul de registri
          output MemtoReg_ID,  //semnal pentru scrierea din memorie in registru
          output MemRead_ID,   //semnal pentru citirea din memoria de date
          output MemWrite_ID,  //semnal pentru scrierea in memoria de date
          output [1:0] ALUop_ID, //codificarea operatiei efectuate de ALU 
          output ALUSrc_ID,      //semnal pentru alegerea operanzilor in ALU
          output Branch_ID);

  assign FUNCT3_ID = INSTRUCTION_ID[14:12];
  assign FUNCT7_ID = INSTRUCTION_ID[31:25];
  assign OPCODE_ID = INSTRUCTION_ID[6:0];
  assign RD_ID = INSTRUCTION_ID[11:7];
  assign RS1_ID = INSTRUCTION_ID[19:15];
  assign RS2_ID = INSTRUCTION_ID[24:20];
    
  control_path control(OPCODE_ID, pipeline_stall, MemRead_ID, MemtoReg_ID, MemWrite_ID, RegWrite_ID, Branch_ID, ALUSrc_ID, ALUop_ID);
  
  registers REGISTER_FILE_MODULE(clk,RegWrite_WB, 
                                 RS1_ID,    
                                 RS2_ID,    
                                 RD_WB,     
                                 ALU_DATA_WB,
                                 REG_DATA1_ID,REG_DATA2_ID);
  
  imm_gen IMM_GEN_MODULE(INSTRUCTION_ID,IMM_ID);
endmodule