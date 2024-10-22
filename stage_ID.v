module stage_ID (PCAddResult_in, Instruction, WriteRegister, WriteData, RegWrite_in, RegWrite_out, MemtoReg, Branch, MemRead, MemWrite, RegDst, ALUOp, ALUSrc, PCSrc, PCAddResult_out, ReadData1, ReadData2, SignExtResult, rt, rd);

  input [31:0] PCAddResult_in;
  input [31:0] Instruction;
  input [4:0] WriteRegister;
  input [31:0] WriteData;
  input RegWrite_in;

  output RegWrite_out;
  output MemtoReg;
  output Branch;
  output MemRead;
  output MemWrite;
  output RegDst;
  output [5:0] ALUOp;
  output ALUSrc;
  output PCSrc;
  output PCAddResult_out;
  output [4:0] ReadData1;
  output [4:0] ReadData2;
  output [31:0] SignExtResult;
  output [4:0] rt;
  output [4:0] rd;

  assign PCAddResult_out = PCAddResult_in;
  assign rt = Instruction[20:16];
  assign rd = Instruction[15:11];
  
  
  //RegisterFile(Instruction, WriteRegister, WriteData, RegWrite, ReadData1, ReadData2);
  RegisterFile b1(Instruction, WriteRegister, WriteData, RegWrite_in, ReadData1, ReadData2);

  //SignExtension(Instruction, out);
  SignExtension b2(Instruction, SignExtResult);

  //Controller(Instruction, RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite);
  Controller b3(Instruction, RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite_out);

endmodule
