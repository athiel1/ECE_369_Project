module stage_MEM (MemWrite_MEM, MemRead_MEM, Branch_MEM, MemtoReg_in_MEM, RegWrite_in_MEM, ALUAddResult_in_MEM, Zero_MEM, ALUResult_in_MEM, ReadData2_MEM, 
                 mux2_result_in_MEM, MemtoReg_out_MEM, PCSrc_MEM, ALUResult_out_MEM, mux2_result_out_MEM, ReadData_MEM, RegWrite_out_MEM,
                 Clk_in_MEM, Clk_out_MEM);

  input MemWrite_MEM;
  input MemRead_MEM;
  input Branch_MEM;
  input MemtoReg_in_MEM;
  input RegWrite_in_MEM;
  input [31:0] ALUAddResult_in_MEM;
  input Zero_MEM;
  input [31:0]ALUResult_in_MEM;
  input [31:0] ReadData2_MEM;
  input [31:0] mux2_result_in_MEM;
  input Clk_in_MEM;

  output MemtoReg_out_MEM;
  //output [31:0] ALUAddResult_out_MEM;
  output PCSrc_MEM;
  output [31:0] ALUResult_out_MEM;
  output [31:0] mux2_result_out_MEM;
  output [31:0] ReadData_MEM;
  output RegWrite_out_MEM;
  // maybe need ALUAddResult. But it goes through pipeline
  output Clk_out_MEM;

  assign RegWrite_out_MEM = RegWrite_in_MEM;
  assign MemtoReg_out_MEM = MemtoReg_in_MEM;
  assign ALUResult_out_MEM = ALUResult_in_MEM;
  assign mux2_result_out_MEM = mux2_result_in_MEM;
  assign Clk_out_MEM = Clk_in_MEM;
  //assign ALUAddResult_out_MEM = ALUAddResult_in_MEM;
  
  //Branch(Branch, Zero, PCSrc);
  Branch d1(Branch_MEM, Zero_MEM, PCSrc_MEM);

  //DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData)
  DataMemory d2(ALUResult_in_MEM, ReadData2_MEM, Clk_in_MEM, MemWrite_MEM, MemRead_MEM, ReadData_MEM); 
  

endmodule
