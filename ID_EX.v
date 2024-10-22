`timescale 1ns / 1ps


module IF_ID(PC_in_IDEX, readReg1_in_IDEX, readReg2_in_IDEX, signExtend_in_IDEX, instr_rt_in_IDEX, instr_rd_in_IDEX, control_WB_in_IDEX, control_M_in_IDEX, control_EX_in_IDEX, 
             PC_out_IDEX, readReg1_out_IDEX, readReg2_out_IDEX, signExtend_out_IDEX, instr_rt_out_IDEX, instr_rd_out_IDEX, control_WB_out_IDEX, control_M_out_IDEX, RegDst_IDEX,
             ALUOp_IDEX, ALUSrc_IDEX); 
  
  input [31:0] PC_in_IDEX;
  input [4:0] readReg1_in_IDEX;
  input [4:0] readReg2_in_IDEX;
  input [31:0] signExtend_in_IDEX;
  input [4:0] instr_rt_in_IDEX;
  input [15:0] instr_rd_in_IDEX;
  input [31:0] control_WB_in_IDEX;
  input [31:0] control_M_in_IDEX;
  input [31:0] control_EX_in_IDEX;  

  
  output [31:0] PC_out_IDEX;
  output [4:0] readReg1_out_IDEX;
  output [4:0] readReg2_out_IDEX;
  output [31:0] signExtend_out_IDEX;
  output [4:0] instr_rt_out_IDEX;
  output [15:0] instr_rd_out_IDEX;
  output [31:0] control_WB_out_IDEX;
  output [31:0] control_M_out_IDEX;
  output RegDst_IDEX;
  output ALUOp_IDEX;
  output ALUSrc_IDEX;

  always @(*) begin
    PC_out_IDEX <= PC_in_IDEX;
    readReg1_out_IDEX <= readReg1_in_IDEX;
    readReg2_out_IDEX <= readReg2_in_IDEX;
    signExtend_out_IDEX <= signExtend_in_IDEX;
    instr_rt_out_IDEX <= instr_rt_in_IDEX;
    instr_rd_out_IDEX <= instr_rd_in_IDEX;
    control_WB_out_IDEX <= control_WB_in_IDEX;
    control_M_out_IDEX <= control_M_in_IDEX;
    RegDst_IDEX <= control_EX_in_IDEX; // FIX ME
    ALUOp_IDEX <= control_EX_in_IDEX;  // FIX ME
    ALUSrc_IDEX <= control_EX_in_IDEX;  // FIX ME
    
  end


endmodule
