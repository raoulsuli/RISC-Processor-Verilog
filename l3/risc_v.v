module RISC_V(input clk,
                    input reset,
                    output [31:0] PC_EX,
                    output [31:0] ALU_OUT_EX,
                    output [31:0] PC_MEM,
                    output PCSrc,
                    output [31:0] DATA_MEMORY_MEM,
                    output [31:0] ALU_DATA_WB,
                    output [1:0] forwardA, forwardB,
                    output pipeline_stall);
//IF
wire [31:0] PC_IF;          
wire [31:0] PC_4_IF;
wire [31:0] PC_MUX;
wire [31:0] INSTRUCTION_IF;
wire [9:0] instruction_address = PC_IF[11:2];
wire PC_Write;

//ID
wire [31:0] PC_ID;
wire [31:0] INSTRUCTION_ID;
wire [31:0] IMM_ID;
wire [31:0] REG_DATA1_ID,REG_DATA2_ID;
wire RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID;
wire [1:0] ALUop_ID;
wire ALUSrc_ID;
wire Branch_ID; 

wire [2:0] FUNCT3_ID; assign FUNCT3_ID = INSTRUCTION_ID[14:12];
wire [6:0] FUNCT7_ID; assign FUNCT7_ID = INSTRUCTION_ID[31:25];
wire [6:0] OPCODE; assign OPCODE = INSTRUCTION_ID[6:0];
wire [4:0] RD_ID; assign RD_ID = INSTRUCTION_ID[11:7];
wire [4:0] RS1_ID; assign RS1_ID = INSTRUCTION_ID[19:15];
wire [4:0] RS2_ID; assign RS2_ID = INSTRUCTION_ID[24:20];
wire IF_ID_write;

//EX
wire [31:0] PC_Branch;
wire [31:0] IMM_EX;
wire [31:0] REG_DATA1_EX,REG_DATA2_EX;
wire RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX;
wire Branch_EX;
wire [1:0] ALUop_EX;
wire ALUSrc_EX;
wire [2:0] FUNCT3_EX;
wire [6:0] FUNCT7_EX;
wire [4:0] RD_EX;
wire [4:0] RS1_EX;
wire [4:0] RS2_EX;
  
wire [3:0] ALU_control;
wire ZERO_EX;
wire [1:0] forwardA,forwardB;
wire [31:0] MUX_A_EX,MUX_B_EX;
wire [31:0] RS2_IMM_EX;

//MEM
wire RegWrite_MEM,MemtoReg_MEM,MemRead_MEM,MemWrite_MEM;
wire Branch_MEM;
wire [31:0] REG_DATA2_MEM;
wire [4:0] RS2_MEM;
wire [4:0] RD_MEM;
wire [31:0] ALU_OUT_MEM;
wire ZERO_MEM;
wire [2:0] FUNCT3_MEM;
  
wire beq; assign beq = ZERO_MEM & (~FUNCT3_MEM[2]) & (~FUNCT3_MEM[1]) & (~FUNCT3_MEM[0]);
wire bne; assign bne = (~ZERO_MEM) & (~FUNCT3_MEM[2]) & (~FUNCT3_MEM[1]) & FUNCT3_MEM[0];
wire blt; assign blt = ALU_OUT_MEM[0] & FUNCT3_MEM[2] & (~FUNCT3_MEM[0]);
wire bge; assign bge = (~ALU_OUT_MEM[0]) & FUNCT3_MEM[2] & FUNCT3_MEM[0];
  
wire forwardC;
wire [31:0] MUX_C_MEM;

//WB
wire RegWrite_WB,MemtoReg_WB;
wire [31:0] DATA_MEMORY_WB;
wire [31:0] ALU_OUT_WB;
wire [4:0] RD_WB;

//pipeline registers
IF_ID_reg IF_ID(clk,reset,
                IF_ID_write,
                PC_IF,INSTRUCTION_IF,
                PC_ID,INSTRUCTION_ID);

ID_EX_reg ID_EX(clk,reset,1'b1,
                         RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID,ALUSrc_ID,Branch_ID,ALUop_ID,
                         PC_ID,REG_DATA1_ID,REG_DATA2_ID,IMM_ID,
                         FUNCT7_ID,FUNCT3_ID,
                         RS1_ID,RS2_ID,RD_ID,
                         RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX,ALUSrc_EX,Branch_EX,ALUop_EX,
                         PC_EX,REG_DATA1_EX,REG_DATA2_EX,IMM_EX,
                         FUNCT7_EX,FUNCT3_EX,
                         RS1_EX,RS2_EX,RD_EX);

EX_MEM_reg EX_MEM(clk,reset,1'b1,
                           RegWrite_EX,MemtoReg_EX,MemRead_EX,MemWrite_EX,Branch_EX,
                           PC_Branch,FUNCT3_EX,
                           ALU_OUT_EX,ZERO_EX,
                           MUX_B_EX,
                           RS2_EX,RD_EX,
                           RegWrite_MEM,MemtoReg_MEM,MemRead_MEM,MemWrite_MEM,Branch_MEM,
                           PC_MEM,FUNCT3_MEM,
                           ALU_OUT_MEM,ZERO_MEM,
                           REG_DATA2_MEM,
                           RS2_MEM,RD_MEM);
  
MEM_WB_reg MEM_WB(clk,reset,1'b1,
                           RegWrite_MEM,MemtoReg_MEM,
                           DATA_MEMORY_MEM,
                           ALU_OUT_MEM,
                           RD_MEM,
                           RegWrite_WB,MemtoReg_WB,
                           DATA_MEMORY_WB,
                           ALU_OUT_WB,
                           RD_WB);
  
//IF
IF IF(clk, reset, PCSrc, PC_Write, PC_Branch, PC_IF, INSTRUCTION_IF);                           
  
//ID
ID ID(clk, PC_ID, INSTRUCTION_ID, RegWrite_WB, ALU_DATA_WB, RD_WB,
      pipeline_stall, IMM_ID, REG_DATA1_ID,REG_DATA2_ID, FUNCT3_ID, FUNCT7_ID,
      OPCODE, RD_ID,
      RS1_ID, RS2_ID, RegWrite_ID, MemtoReg_ID, MemRead_ID, MemWrite_ID,
      ALUop_ID, ALUSrc_ID, Branch_ID);
  
hazard_detection HAZARD_DETECTION_UNIT(RD_EX,  //ID_EX.rd
                                       RS1_ID, //IF_ID.rs1
                                       RS2_ID, //IF_ID.rs2
                                       MemRead_EX,   //ID_EX.MemRead
                                       PC_Write,IF_ID_write,
                                       pipeline_stall);
  
//EX
EX EX(IMM_EX, REG_DATA1_EX, REG_DATA2_EX, PC_EX, FUNCT3_EX, FUNCT7_EX,
      RD_EX, RS1_EX, RS2_EX, RegWrite_EX, MemtoReg_EX, MemRead_EX,
      MemWrite_EX, ALUop_EX, ALUSrc_EX, Branch_EX, forwardA, forwardB,
      ALU_DATA_WB, ALU_OUT_MEM, ZERO_EX, ALU_OUT_EX,
      PC_Branch_EX, REG_DATA2_EX_FINAL);
  
forwarding FORWARDING_UNIT(RS1_EX, //rs1
                           RS2_EX,  //rs2
                           RD_MEM,     //ex_mem_rd
                           RD_WB,     //mem_wb_rd
                           RegWrite_MEM,     //ex_mem_regwrite
                           RegWrite_WB,     //mem_wb_regwrite
                           forwardA,forwardB);
  
//MEM 
data_memory DATA_MEMORY_MODULE(clk,
                               MemRead_MEM,      //MemRead
                               MemWrite_MEM,     //MemWrite
                               ALU_OUT_MEM,      //ALU_OUT(address)
                               MUX_C_MEM,     //rs2(data)
                               DATA_MEMORY_MEM);
                                         
mux2_1 MUX_FORWARD_C(REG_DATA2_MEM,
                     DATA_MEMORY_WB,
                     forwardC,
                     MUX_C_MEM);
  
  //WB
mux2_1 MUX_ALU_DATA(ALU_OUT_WB,   //ALU_out result
                    DATA_MEMORY_WB, //Data_memory_out 
                    MemtoReg_WB,    //MemtoReg
                    ALU_DATA_WB);
endmodule