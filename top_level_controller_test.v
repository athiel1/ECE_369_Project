`timescale 1ns / 1ps

module TopModule(
    input wire Clk,         // Clock signal
    input wire Rst,         // Reset signal
    input wire [31:0] Instruction,  // Instruction input
    input wire Zero,        // Zero signal for branch evaluation
    output wire [5:0] ALUControlSignal, // ALU Control signal output
    output wire PCSrc,      // Program counter source (Branch decision)
    output wire Debug       // Debug signal from Controller
);

    wire [1:0] ALUOp;         // ALU operation code from Controller
    wire RegDst, ALUSrc, MemRead, MemWrite, MemtoReg, RegWrite, ALUZero, Branch;

    // Instantiate the Controller module
    Controller controller(
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
        .Debug(Debug)
    );

    // Instantiate the ALUControl module
    ALUControl alu_control(
        .ALUOp(ALUOp),
        .funct(Instruction[5:0]),      // Assuming funct field is bits [5:0]
        .I_op(Instruction[31:26]),     // Assuming I-type opcode in bits [31:26]
        .ALUControl(ALUControlSignal)
    );

    // Instantiate the Branch module
    Branch branch_module(
        .Branch(Branch),
        .Zero(Zero),
        .PCSrc(PCSrc)
    );

endmodule
