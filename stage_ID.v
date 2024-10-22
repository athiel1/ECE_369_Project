module stage_ID (PCAddResult_in_ID, Instruction_ID, WriteRegister_ID, WriteData_ID, RegWrite_in_ID, RegWrite_out_ID, MemtoReg_ID, Branch_ID, MemRead_ID, MemWrite_ID, RegDst_ID, ALUOp_ID, 
                 ALUSrc_ID, PCSrc_ID, PCAddResult_out_ID, ReadData1_ID, ReadData2_ID, SignExtResult_ID, rt_ID, rd_ID);

  input [31:0] PCAddResult_in_ID;
  input [31:0] Instruction_ID;
  input [4:0] WriteRegister_ID;
  input [31:0] WriteData_ID;
  input RegWrite_in_ID;

  output RegWrite_out_ID;
  output MemtoReg_ID;
  output Branch_ID;
  output MemRead_ID;
  output MemWrite_ID;
  output RegDst_ID;
  output [5:0] ALUOp_ID;
  output ALUSrc_ID;
  output PCSrc_ID;
  output PCAddResult_out_ID;
  output [4:0] ReadData1_ID;
  output [4:0] ReadData2_ID;
  output [31:0] SignExtResult_ID;
  output [4:0] rt_ID;
  output [4:0] rd_ID;

  assign PCAddResult_out = PCAddResult_in_ID;
  assign rt = Instruction_ID[20:16];
  assign rd = Instruction_ID[15:11];
  
  
  //RegisterFile(Instruction, WriteRegister, WriteData, RegWrite, ReadData1, ReadData2);
  RegisterFile b1(Instruction_ID, WriteRegister_ID, WriteData_ID, RegWrite_in_ID, ReadData1_ID, ReadData2_ID);

  //SignExtension(Instruction, out);
  SignExtension b2(Instruction_ID, SignExtResult_ID);

  //Controller(Instruction, RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite);
  Controller b3(Instruction_ID, RegDst_ID, ALUOp_ID, ALUSrc_ID, Branch_ID, MemRead_ID, MemWrite_ID, MemtoReg_ID, RegWrite_out_ID);

endmodule
