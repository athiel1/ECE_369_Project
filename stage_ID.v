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
  
  
  

endmodule
