`timescale 1ns / 1ps

module top_level_controller_test(
    input wire Clk,
    input wire Rst,
    input wire [31:0] Instruction,
    input wire Zero,
    output wire [1:0] ALUOp,
    output wire ALUSrc,
    output wire RegWrite,
    output wire [5:0] ALUControl
);

    // Wires to connect Controller and ALUControl
    wire RegDst;
    wire ALUZero;
    wire Branch;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire PCSrc;
    
    // Instantiate the Controller
    Controller ctrl (
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .Zero(Zero),
        .RegDst(RegDst),
        .ALUOp(ALUOp),
        .ALUZero(ALUZero),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .PCSrc(PCSrc),
        .Debug() // Optional debug output
    );

    // Instantiate the ALUControl
    ALUControl aluCtrl (
        .ALUOp(ALUOp),
        .funct(Instruction[5:0]), // Assuming funct is part of the instruction
        .ALUControl(ALUControl)
    );

endmodule
