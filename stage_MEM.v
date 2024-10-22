module stage_MEM (MemWrite, MemRead, Branch, MemtoReg_in, RegWrite_in, Zero, ALUResult_in, ReadData2, mux2_result_in,
                 MemtoReg_out, PCSrc, ALUResult_out, mux2_result_out, ReadData, RegWrite_out, ALUAddResult);

  input MemWrite;
  input MemRead;
  input Branch;
  input MemtoReg_in;
  input RegWrite_in;
  input Zero;
  input ALUResult_in;
  input [4:0] ReadData2;
  input [4:0] mux2_result_in;

  output MemtoReg_out;
  output PCSrc;
  output [31:0] ALUResult_out;
  output [4:0] mux2_result_out;
  output ReadData;
  output RegWrite_out;
  output [31:0] ALUAddResult;
  
  //Branch(Branch, Zero, PCSrc);
  Branch d1(Branch, Zero, PCSrc);

  //DataMemory(Address, WriteData, MemWrite, MemRead, ReadData); 
  DataMemory d2(ALUResult_in, ReadData2, MemWrite, MemRead, ReadData); 
  

endmodule
