`timescale 1ns / 1ps


module IF_ID(PC_in, readReg1, readReg2, signExtend, instr_rt_in, instr_rd_in, control_WB_in, control_M_in, control_EX_in, PC_out); 
  
  input [31:0] PC_in;
  input [4:0] readReg1;
  input [4:0] readReg2;
  input [31:0] signExtend;
  input [4:0] instr_rt_in;
  input [4:0] instr_rd_in;
  input [31:0] control_WB_in;
  input [31:0] control_M_in;
  input [31:0] control_EX_in;
  
  
  

  output [31:0] PC_out;
  output [31:0] instructionMem_out;

  always @(*) begin
    
  end


endmodule
