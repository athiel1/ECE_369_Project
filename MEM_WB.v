`timescale 1ns / 1ps

module MEM_WB(WB_in, readMem_in, ALUResult_in, muxResult_in, RegWrite, MemtoRead, readMem_out, ALUResult_out, muxResult_out);
  
  input [31:0] WB_in;
  input [31:0] readMem_in;
  input [31:0] ALUResult_in;
  input [31:0] muxResult_in;

  output RegWrite;
  output MemtoRead;
  output [31:0] readMem_out;
  output [31:0] ALUResult_out;
  output [31:0] muxResult_out;

  always @(*) begin
    RegWrite = ???     //FIXME
    MemtoRead = ???     //FIXME
    readMem_out = readMem_in;
    ALUResult_out = ALUResult_in;
    muxResult_out = muxResult_in;
  end


endmodule
