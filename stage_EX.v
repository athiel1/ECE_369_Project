module stage_EX (RegWrite_in, MemtoReg_in, Branch_in, MemRead_in, MemWrite_in, RegDst, ALUOp, ALUSrc, PCAddResult, ReadData1, ReadData2_in, SignExtResult, rt, rd, 
                 RegWrite_out, MemtoReg_out, Branch_out, MemRead_out, MemWrite_out, ALUAddResult, Zero, ALUResult, ReadData2_out, mux2_result);

  input RegWrite_in;
  input MemtoReg_in;
  input Branch_in;
  input MemRead_in;
  input MemWrite_in;
  input RegDst;
  input [5:0] ALUOp;
  input ALUSrc;
  input [31:0] PCAddResult;
  input [4:0] ReadData1;
  input [4:0] ReadData2_in;
  input [31:0] SignExtResult;
  input [4:0] rt;
  input [4:0] rd;

  output RegWrite_out;
  output MemtoReg_out;
  output Branch_out;
  output MemRead_out;
  output MemWrite_out;
  output [31:0] ALUAddResult;
  output Zero;
  output [31:0] ALUResult;
  output ReadData2_out;
  output mux2_result;

  wire SL_result;
  wire mux1_result;
  wire ALUControl;

  assign RegWrite_out = RegWrite_in;
  assign MemtoReg_out = MemtoReg_in;
  assign Branch_out = Branch_in;
  assign MemRead_out = MemRead_in;
  assign MemWrite_out = MemWrite_in;
  assign ReadData2_out = ReadData2_in;

  //ShiftLeft2(in, out);
  ShiftLeft2 c1(SignExtResult, SL_result);
  
  //ALUAdd(A, B, ALUAddResult);
  ALUAdd c2(PCAddResult, SL_result, ALUAddResult);

  //Mux32Bit2To1(inA, inB, sel, out);
  Mux32Bit2To1 c3(ReadData2_in, SignExtResult, ALUSrc, mux1_result);

  //ALUControl(ALUOp, funct, ALUControl);
  ALUControl c4(ALUOp, SignExtResult, ALUControl);    // if there is an error, we want 6 bits from SignExtResult

  //ALU32Bit(ALUControl, A, B, ALUResult, Zero);
  ALU32Bit c5(ALUControl, ReadData1, mux1_result, ALUResult, Zero);

  //Mux32Bit2To1(inA, inB, sel, out);
  Mux32Bit2To1 c6(rt, rd, RegDst, mux2_result);
  

  

endmodule
