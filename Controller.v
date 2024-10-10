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


module controller(Clk, Rst, Instruction, RegDst, ALUOp, ALUZero, ALUSrc, Branch, MemRead, MemtoReg, RegWrite, PCSrc);
    input wire Clk;
    input wire Rst;
    input [31:0] Instruction;

    wire [5:0] operation;
    wire [5:0] funct;
    
    output reg RegDst;
    output reg [5:0] ALUOp;
    output reg ALUZero;
    output reg ALUSrc;
    output reg Branch;
    output reg MemRead;
    output reg MemtoReg;
    output reg RegWrite;
    output reg PCSrc;

    assign operation = Instruction[31:26];
    assign funct = Instruction[5:0];

    always @(posedge Clk, Rst) begin
            RegDst <= 0;
            ALUOp <= 0;
            ALUZero <= 0;
            ALUSrc <= 0;
            Branch <= 0;
            MemRead <= 0;
            MemtoReg <= 0;
            RegWrite <= 0;
            PCSrc <= 0;
    end

    always @(Instruction) begin
        case (Instruction[31:26]) 
            6'b00000: // R-Type
                RegDst = 1;
                ALUOp <= funct; 
                ALUZero = 0;     //doesn't matter
                ALUSrc = 0;
                Branch = 0;      //doesn't matter
                MemRead = 0;     //doesn't matter
                MemWrite = 1;
                MemtoReg = 1;
                RegWrite = 1;
                PCSrc = 0;       //doesn't matter

            6'100011: // Load
                RegDst = 0;
                ALUOp = 6'b100000;
                ALUZero = 0;     //doesn't matter
                ALUSrc = 1;
                Branch = 0;      //doesn't matter
                MemRead = 1;
                MemWrite = 0;
                MemtoReg = 0;
                RegWrite = 1;
                PCSrc = 0;       //doesn't matter

            6'101011: // Store
                RegDst = 0;
                ALUOp = 6'b100000;
                ALUZero = 0;     //doesn't matter
                ALUSrc = 1;
                Branch = 0;      //doesn't matter
                MemRead = 0;
                MemWrite = 1;
                MemtoReg = 0;    //doesn't matter
                RegWrite = 0;
                PCSrc = 0;       //doesn't matter

            6'000100: // Branch
                RegDst = 0;
                ALUOp = 6'b100000;   // doesn't matter?
                ALUZero = 1;     
                ALUSrc = 1;
                Branch = 1;     
                MemRead = 0;     //doesn't matter
                MemWrite = 0;    //has to be 0 so we don't overwrite
                MemtoReg = 0;    //doesn't matter
                RegWrite = 0;    //has to be zero so we don't overwrite
                PCSrc = 1;       
            
        endcase
    end


endmodule




