`timescale 1ns / 1ps

module EX_MEM(WB_in, M_in, addResult_in, ALUZero_in, ALUResult_in, readReg2_in, muxResult_in,
              WB_out, Branch, MemRead, MemWrite, addResult_out, ALUZero_out, ALUResult_out, readReg2_out, muxResult_out); 
  
  input [31:0] WB_in;
  input [31:0] M_in
  input [31:0] addResult_in;
  input ALUZero_in;
  input [31:0] ALUResult_in;
  input [4:0] readReg2_in;
  input [4:0] muxResult_in;

  output [31:0] WB_out;
  output Branch;
  output MemRead;
  output MemWrite;
  output [31:0] addResult_out;
  output ALUZero_out;
  output [31:0] ALUResult_out;
  output [4:0] readReg2_out;
  output [4:0] muxResult_out;

  always @(*) begin
    WB_out = WB_in;
    addResult_out = addResult_in;
    ALUZero_out = ALUZero_in;
    ALUResult_out = ALUResult_in;
    readReg2_out = readReg2_in;
    muxResult_out = muxResult_in;
  end


endmodule
