`timescale 1ns / 1ps

module EX_MEM(WB_in_EXMEM, M_in_EXMEM, addResult_in_EXMEM, ALUZero_in_EXMEM, ALUResult_in_EXMEM, readReg2_in_EXMEM, muxResult_in_EXMEM,
              WB_out_EXMEM, Branch_EXMEM, MemRead_EXMEM, MemWrite_EXMEM, addResult_out_EXMEM, ALUZero_out_EXMEM, ALUResult_out_EXMEM, readReg2_out_EXMEM, muxResult_out_EXMEM); 
  
  input [31:0] WB_in_EXMEM;
  input [31:0] M_in_EXMEM;
  input [31:0] addResult_in_EXMEM;
  input ALUZero_in_EXMEM;
  input [31:0] ALUResult_in_EXMEM;
  input [4:0] readReg2_in_EXMEM;
  input [4:0] muxResult_in_EXMEM;

  output [31:0] WB_out_EXMEM;
  output Branch_EXMEM;
  output MemRead_EXMEM;
  output MemWrite_EXMEM;
  output [31:0] addResult_out_EXMEM;
  output ALUZero_out_EXMEM;
  output [31:0] ALUResult_out_EXMEM;
  output [4:0] readReg2_out_EXMEM;
  output [4:0] muxResult_out_EXMEM;

  always @(*) begin
    WB_out = WB_in_EXMEM;
    addResult_out_EXMEM = addResult_in_EXMEM;
    ALUZero_out_EXMEM = ALUZero_in_EXMEM;
    ALUResult_out_EXMEM = ALUResult_in_EXMEM;
    readReg2_out_EXMEM = readReg2_in_EXMEM;
    muxResult_out_EXMEM = muxResult_in_EXMEM;
  end


endmodule
