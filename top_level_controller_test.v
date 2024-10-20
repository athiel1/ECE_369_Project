`timescale 1ns / 1ps

module top_level_controller_test(
    input wire Clk,
    input wire Rst,
    input [31:0] Instruction, // Instruction input to Controller
    input [31:0] A,           // Operand A to ALU
    input [31:0] B,           // Operand B to ALU
    output [31:0] ALUResult,  // Result from ALU
    output Zero               // Zero flag from ALU
);

    // Internal Signals
    wire [5:0] ALUControlSignal; // Control signal from ALUControl to ALU
    wire [1:0] ALUOp;            // ALUOp signal from Controller to ALUControl
    wire [5:0] funct;            // Function code from the instruction (R-type instructions)
    wire Branch, MemRead, MemWrite, MemtoReg, RegWrite, PCSrc, Debug; // Control signals from Controller
    wire [31:0] ALUOut;          // ALU Output
    wire PCBranchSrc;            // PCSrc from Branch unit
    wire ALUSrc;                 // ALUSrc control signal

    // Assign function and opcode extraction from Instruction
    assign funct = Instruction[5:0];        // Extract funct (R-type)
    assign I_op = Instruction[31:26];       // Extract operation code from Instruction

    // Instantiate Controller
    Controller controller_inst(
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .RegDst(RegDst),
        .ALUOp(ALUOp),
        .ALUZero(Zero),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .PCSrc(PCSrc),
        .Debug(Debug)
    );

    // Instantiate ALUControl
    ALUControl alucontrol_inst(
        .ALUOp(ALUOp),
        .funct(funct),
        .I_op(I_op),
        .ALUControl(ALUControlSignal)
    );

    // Instantiate ALU32Bit
    ALU32Bit alu_inst(
        .ALUControl(ALUControlSignal),
        .A(A),
        .B(B),
        .ALUResult(ALUOut),
        .Zero(Zero)
    );

    // Instantiate Branch Control Logic
    Branch branch_inst(
        .Branch(Branch),
        .Zero(Zero),
        .PCSrc(PCBranchSrc)
    );

    // Output ALUResult
    assign ALUResult = ALUOut;

endmodule
