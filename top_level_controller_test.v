`timescale 1ns / 1ps

module top_level_controller_test(Clk, Rst, Instruction, A, B, ALUResult, PCSrc);

    input wire Clk;
    input wire Rst;
    input [31:0] Instruction; // Instruction input to Controller
    input [5:0] A;           // Operand A to ALU
    input [5:0] B;           // Operand B to ALU

    wire [5:0] funct;
    wire Zero;
    wire [5:0] ALUControlSignal; // Control signal from ALUControl to ALU
    wire [5:0] ALUOp;            // ALUOp signal from Controller to ALUControl
    wire ALUSrc, RegDst, Branch, MemWrite, MemRead, MemtoReg, RegWrite;
    
    output [31:0] ALUResult;  // Result from ALU
    output PCSrc;

    funct = Instruction[5:0];

    //Controller(Clk, Rst, Instruction, RegDst, ALUOp, ALUZero, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite)
    Controller b1(Clk, Rst, Instruction, RegDst, ALUOp, ALUZero, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite);

    //ALUControl(ALUOp, funct, ALUControl)
    ALUControl b2(ALUOp, funct, ALUControlSignal);

    //ALU32Bit(ALUControl, A, B, ALUResult, Zero)
    ALU32Bit b3(ALUControlSignal, A, B, ALUResult, Zero);

    //Branch(Branch, Zero, PCSrc)
    Branch b4(Branch, Zero, PCSrc);







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
