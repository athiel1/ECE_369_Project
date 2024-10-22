module stage_MEM (MemWrite, MemRead, Branch, MemtoReg_in, RegWrite_in, Zero, ALUResult_in, ReadData2, mux2_result_in,
                 MemtoReg_out, PCSrc, ALUResult_out, mux2_result_out, ReadData, RegWrite_out);

  input MemWrite;
  input MemRead;
  input Branch;
  input MemtoReg_in;
  input RegWrite_in;
  input Zero;
  input [31:0]ALUResult_in;
  input [4:0] ReadData2;
  input [4:0] mux2_result_in;

  output MemtoReg_out;
  output PCSrc;
  output [31:0] ALUResult_out;
  output [4:0] mux2_result_out;
  output ReadData;
  output RegWrite_out;
  // maybe need ALUAddResult. But it goes through pipeline

  assign RegWrite_out = RegWrite_in;
  assign MemtoReg_out = MemtoReg_in;
  assign ALUResult_out = ALUResult_in;
  assign mux2_result_out = mux2_result_in;
  
  //Branch(Branch, Zero, PCSrc);
  Branch d1(Branch, Zero, PCSrc);

  //DataMemory(Address, WriteData, MemWrite, MemRead, ReadData); 
  DataMemory d2(ALUResult_in, ReadData2, MemWrite, MemRead, ReadData); 
  

endmodule
