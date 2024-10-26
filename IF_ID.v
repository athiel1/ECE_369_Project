`timescale 1ns / 1ps


module IF_ID(PCAdder_in_IFID, Instruction_in_IFID, PCAdder_out_IFID, Instruction_out_IFID); 
  
  input [31:0] PCAdder_in_IFID;
  input [31:0] Instruction_in_IFID;
  //input Clk_in_IFID, Clk_out_IFID;

  output reg [31:0] PCAdder_out_IFID;
  output reg [31:0] Instruction_out_IFID;
  //output reg Clk_in_IFID;

  always @(posedge Clk) begin
    PCAdder_out_IFID <= PCAdder_in_IFID;
    Instruction_out_IFID <= Instruction_in_IFID;
  end


endmodule









