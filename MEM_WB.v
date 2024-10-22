`timescale 1ns / 1ps

module MEM_WB(WB_in_MEMWB, readMem_in_MEMWB, ALUResult_in_MEMWB, muxResult_in_MEMWB, RegWrite_MEMWB, MemtoRead_MEMWB, readMem_out_MEMWB, ALUResult_out_MEMWB, muxResult_out_MEMWB);
  
  input [31:0] readMem_in_MEMWB;
  input [31:0] ALUResult_in_MEMWB;
  input [31:0] muxResult_in_MEMWB;

  output RegWrite_MEMWB;
  output MemtoRead_MEMWB;
  output [31:0] readMem_out_MEMWB;
  output [31:0] ALUResult_out_MEMWB;
  output [31:0] muxResult_out_MEMWB;

  always @(*) begin
    readMem_out_MEMWB = readMem_in_MEMWB;
    ALUResult_out_MEMWB = ALUResult_in_MEMWB;
    muxResult_out_MEMWB = muxResult_in_MEMWB;
  end


endmodule
