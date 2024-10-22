`timescale 1ns / 1ps


module IF_ID(PC_in_IFID, instructionMem_in_IFID, PC_out_IFID, instructionMem_out_IFID); 
  
  input [31:0] PC_in_IFID;
  input [31:0] instructionMem_in_IFID;

  output [31:0] PC_out_IFID;
  output [31:0] instructionMem_out_IFID;

  always @(*) begin
    PC_out_IFID <= PC_in_IFID;
    instructionMem_out_IFID <= instructionMem_in_IFID;
  end


endmodule









