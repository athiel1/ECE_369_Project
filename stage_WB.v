module stage_WB (ReadData, ALUResult, MemtoReg, RegWrite, mux3_result, mux2_result);

  input [31:0] ReadData;
  input [31:0] ALUResult;
  input MemtoReg;

  output RegWrite;
  output mux3_result;
  output mux2_result;

  //Mux32Bit2To1(inA, inB, sel, out);
  Mux32Bit2To1 e1(ReadData, ALUResult, MemtoReg, mux3_result);
  

endmodule
