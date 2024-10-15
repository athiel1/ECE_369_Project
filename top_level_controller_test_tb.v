`timescale 1ns / 1ps

module TopLevel_tb;

    // Inputs
    reg Clk;
    reg Rst;
    reg [31:0] Instruction;
    reg Zero;

    // Outputs
    wire [31:0] ALUResult;
    wire ZeroFlag;
    wire RegWrite;
    wire [1:0] ALUOp;

    // Instantiate the Top-Level Module
    TopLevel uut (
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .Zero(Zero),
        .ALUResult(ALUResult),
        .ZeroFlag(ZeroFlag),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp)
    );

    // Clock Generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // 100 MHz clock
    end

    initial begin
        // Initialize Inputs
        Rst = 0;
        Instruction = 32'b0;
        Zero = 0;

        // Reset the system
        Rst = 1;
        #10;
        Rst = 0;
        #10;

        // Test R-Type instruction (e.g., ADD)
        Instruction = {6'b000000, 5'b00000, 5'b00001, 5'b00010, 5'b00000, 6'b100000}; // ADD instruction
        #10;
        $display("R-Type Instruction (ADD):");
        $display("Instruction: %b", Instruction);
        $display("ALUResult: %d, ZeroFlag: %b", ALUResult, ZeroFlag);

        // Test Load instruction (LW)
        Instruction = {6'b100011, 5'b00000, 5'b00001, 16'b0000000000000000}; // LW instruction
        #10;
        $display("Load Instruction (LW):");
        $display("Instruction: %b", Instruction);
        $display("ALUResult: %d, ZeroFlag: %b", ALUResult, ZeroFlag);

        // Test Store instruction (SW)
        Instruction = {6'b101011, 5'b00000, 5'b00001, 16'b0000000000000000}; // SW instruction
        #10;
        $display("Store Instruction (SW):");
        $display("Instruction: %b", Instruction);
        $display("ALUResult: %d, ZeroFlag: %b", ALUResult, ZeroFlag);

        // Test Branch instruction (BEQ)
        Instruction = {6'b000100, 5'b00000, 5'b00001, 16'b0000000000000000}; // BEQ instruction
        Zero = 1; // Simulate Zero signal from ALU for branch to be taken
        #10;
        $display("Branch Instruction (BEQ):");
        $display("Instruction: %b", Instruction);
        $display("ALUResult: %d, ZeroFlag: %b", ALUResult, ZeroFlag);

        // Finish the simulation
        $stop;
    end

endmodule
