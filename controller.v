`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 05:34:15 PM
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(Clk, Rst, Instruction, ALUControl);
    input wire Clk;
    input wire Rst;
    input [31:0] Instruction;

    wire [5:0] operation;
    wire [5:0] funct;
    
    output RegDst;
    output ALUOp;
    output ALUZero;
    output ALUSrc;
    output Branch;
    output MemRead;
    output MemtoReg;
    output RegWrite;
    output PCSrc;

    operation = Instruction[31:26];
    funct = Instruction[5:0];

    RegDst = 0;
    ALUOp = 0;
    ALUZero = 0;
    ALUSrc = 0;
    Branch = 0;
    MemRead = 0;
    MemtoReg = 0;
    RegWrite = 0;
    PCSrc = 0;
    
    always @(Instruction) begin
        case (Instruction[31:26]) 
            6'b00000: // R-Type
                ALUOp = funct;
        endcase
    end


endmodule




