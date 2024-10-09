`timescale 1ns / 1ps


module IF_ID(PC_in, readReg1_in, readReg2_in, signExtend_in, instr_rt_in, instr_rd_in, control_WB_in, control_M_in, control_EX_in, 
             PC_out, readReg1_out, readReg2_out, signExtend_out, instr_rt_out, instr_rd_out, control_WB_out, control_M_out, control_EX_out); 
  
  input [31:0] PC_in;
  input [4:0] readReg1_in;
  input [4:0] readReg2_in;
  input [31:0] signExtend_in;
  input [4:0] instr_rt_in;
  input [4:0] instr_rd_in;
  input [31:0] control_WB_in;
  input [31:0] control_M_in;
  input [31:0] control_EX_in;
  
  
  

  output [31:0] PC_out;
  output [4:0] readReg1_out;
  output [4:0] readReg2_out;
  output [31:0] signExtend_out;
  output [4:0] instr_rt_out;
  output [4:0] instr_rd_out;
  output [31:0] control_WB_out;
  output [31:0] control_M_out;
  output [31:0] control_EX_out;

  always @(*) begin
    
  end


endmodule
