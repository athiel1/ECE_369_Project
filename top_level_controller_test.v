`timescale 1ns / 1ps

module top_level_controller_test(
    input wire Clk,
    input wire Rst,
    input wire [31:0] Instruction,
    input wire Zero,
    output wire [31:0] ALUResult,
    output wire [31:0] DataMemoryOut,
    output wire Debug,
    output wire RegDst,
    output wire [1:0] ALUOp,
    output wire ALUZero,
    output wire ALUSrc,
    output wire Branch,
    output wire MemRead,
    output wire MemWrite,
    output wire MemtoReg,
    output wire RegWrite,
    output wire PCSrc
);

    // Internal signals
    wire [31:0] ALUInput1;
    wire [31:0] ALUInput2;
    wire [3:0] ALUControlSignal;
    wire [31:0] ALUOutput;
    wire [31:0] DataMemoryInput; // Input for Data Memory

    // Instantiate the Controller
    Controller controller_inst (
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
        .Debug(Debug)  // Connect Debug signal
    );

    // Instantiate the ALU
    ALU alu_inst (
        .Input1(ALUInput1),
        .Input2(ALUInput2),
        .ALUControl(ALUControlSignal),
        .ALUResult(ALUOutput)
    );

    // Instantiate the ALU Control
    ALUControl alu_control_inst (
        .ALUOp(ALUOp),
        .FunctionCode(Instruction[5:0]),  // R-type instruction's funct field
        .ALUControl(ALUControlSignal)
    );

    // Data Memory (simple RAM model, can be replaced with actual RAM)
    DataMemory data_memory_inst (
        .Clk(Clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Address(ALUOutput),           // Address is the ALU output
        .WriteData(DataMemoryInput),   // Input data for memory
        .ReadData(DataMemoryOut)       // Output data from memory
    );

    // ALU Inputs Multiplexing
    assign ALUInput1 = ...; // Assign based on register file or other inputs
    assign ALUInput2 = (ALUSrc) ? DataMemoryInput : ...; // Choose between immediate or data from registers

endmodule
