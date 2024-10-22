module stage_EX ();

  input RegWrite_in;
  input MemtoReg_in;
  input Branch_in;
  input MemRead_in;
  input MemWrite_in;
  input RegDst;
  input [5:0] ALUOp;
  input ALUSrc;
  input PCSrc_in;
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
  output PCSrc_out;
  output [31:0] ALUAddResult;
  output Zero;
  output [31:0] ALUResult;
  output ReadData2_out;
  output mux2_result;

  wire SL_result;
  wire mux1_result;
  wire ALUControl;

  

  

endmodule
