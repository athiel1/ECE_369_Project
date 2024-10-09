`timescale 1ns / 1ps


module IF_ID(PC_in, instructionMem_in, PC_out, instructionMem_out); 
  
  input [31:0] PC_in;
  input [31:0] instructionMem_in;

  output [31:0] PC_out;
  output [31:0] instructionMem_out;

  always @(*) begin
    PC_out <= PC_in;
    instructionMem_out <= instructionMem_in;
  end


endmodule









