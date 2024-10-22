`timescale 1ns / 1ps


module IF_ID(PCAddResult_in_IDEX, ReadData1_in_IDEX, ReadData2_in_IDEX, signExtend_in_IDEX, rt_in_IDEX, rd_in_IDEX, RegWrite_in_IDEX, MemtoReg_in_IDEX, Branch_in_IDEX, MemRead_in_IDEX,  
             MemWrite_in_IDEX, RegDst_in_IDEX, ALUOp_in_IDEX, ALUSrc_in_IDEX, PCAddResult_out_IDEX, ReadData1_out_IDEX, ReadData2_out_IDEX, signExtend_out_IDEX, rt_out_IDEX, rd_out_IDEX, 
             RegWrite_out_IDEX, MemtoReg_out_IDEX, Branch_out_IDEX, MemRead_out_IDEX, MemWrite_out_IDEX, RegDst_out_IDEX, ALUOp_out_IDEX, ALUSrc_out_IDEX); 
  
  input [31:0] PCAddResult_in_IDEX;
  input [4:0] ReadData1_in_IDEX;
  input [4:0] ReadData2_in_IDEX;
  input [31:0] signExtend_in_IDEX;
  input [4:0] rt_in_IDEX;
  input [15:0] rd_in_IDEX;
  input RegWrite_in_IDEX;
  input MemtoReg_in_IDEX;
  input Branch_in_IDEX;
  input MemRead_in_IDEX;
  input MemWrite_in_IDEX;
  input RegDst_in_IDEX;
  input [5:0] ALUOp_in_IDEX;
  input ALUSrc_in_IDEX; 

  
  output [31:0] PCAddResult_out_IDEX;
  output [4:0] ReadData1_out_IDEX;
  output [4:0] ReadData2_out_IDEX;
  output [31:0] signExtend_out_IDEX;
  output [4:0] rt_out_IDEX;
  output [15:0] rd_out_IDEX;
  output RegWrite_out_IDEX;
  output MemtoReg_out_IDEX;
  output Branch_out_IDEX;
  output MemRead_out_IDEX;
  output MemWrite_out_IDEX;
  output RegDst_out_IDEX;
  output [5:0] ALUOp_out_IDEX;
  output ALUSrc_out_IDEX;

  always @(*) begin
    PCAddResult_out_IDEX <= PCAddResult_in_IDEX;
    ReadData1_out_IDEX <= ReadData1_in_IDEX;
    ReadData2_out_IDEX <= ReadData2_in_IDEX;
    signExtend_out_IDEX <= signExtend_in_IDEX;
    rt_out_IDEX <= rt_in_IDEX;
    rd_out_IDEX <= rd_in_IDEX;
    RegWrite_out_IDEX <= RegWrite_in_IDEX;
    MemtoReg_out_IDEX <= MemtoReg_in_IDEX;
    Branch_out_IDEX <= Branch_in_IDEX;
    MemRead_out_IDEX <= MemRead_in_IDEX;
    MemWrite_out_IDEX <= MemWrite_in_IDEX;
    RegDst_out_IDEX <= RegDst_in_IDEX;
    ALUOp_out_IDEX <= ALUOp_in_IDEX;
    ALUSrc_out_IDEX <= ALUSrc_in_IDEX; 
    
  end


endmodule
