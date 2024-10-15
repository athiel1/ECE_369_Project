`timescale 1ns / 1ps

module top_level_controller_test_tb;

    // Inputs
    reg Clk;
    reg Rst;
    reg [31:0] Instruction;
    reg Zero;

    // Outputs
    wire [31:0] ALUResult;
    wire [31:0] DataMemoryOut;
    wire Debug;
    wire RegDst;
    wire [1:0] ALUOp;
    wire ALUZero;
    wire ALUSrc;
    wire Branch;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire RegWrite;
    wire PCSrc;

    // Instantiate the Unit Under Test (UUT)
    TopLevel uut (
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .Zero(Zero),
        .ALUResult(ALUResult),
        .DataMemoryOut(DataMemoryOut),
        .Debug(Debug),
        .RegDst(RegDst),
        .ALUOp(ALUOp),
        .ALUZero(ALUZero),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .PCSrc(PCSrc)
    );

    // Clock Generation
    always #5 Clk = ~Clk; // Generate a clock with a period of 10 ns

    initial begin
        // Initialize Inputs
        Clk = 0;
        Rst = 0;
        Instruction = 32'b0;
        Zero = 0;

        // Reset the design
        Rst = 1;       // Assert reset
        #10;          // Wait for 10 ns
        Rst = 0;       // De-assert reset
        #10;          // Wait for 10 ns

        // Test R-Type instruction (e.g., ADD)
        Instruction = 32'b000000_00001_00010_00011_00000_100000; // R-type ADD instruction
        #10;
        $display("R-Type Instruction:");
        $display("ALUResult: %b, Debug: %b, RegDst: %b, ALUOp: %b, ALUSrc: %b, Branch: %b, MemRead: %b, MemWrite: %b, MemtoReg: %b, RegWrite: %b, PCSrc: %b", 
            ALUResult, Debug, RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite, PCSrc);

        // Test Load instruction (LW)
        Instruction = 32'b100011_00001_00010_00000_00000_000000; // opcode=100011 for lw
        Zero = 0; // Zero signal for branch
        #10;
        $display("Load Instruction (lw):");
        $display("ALUResult: %b, Debug: %b, RegDst: %b, ALUOp: %b, ALUSrc: %b, Branch: %b, MemRead: %b, MemWrite: %b, MemtoReg: %b, RegWrite: %b, PCSrc: %b", 
            ALUResult, Debug, RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite, PCSrc);

        // Test Store instruction (SW)
        Instruction = 32'b101011_00001_00010_00000_00000_000000; // opcode=101011 for sw
        #10;
        $display("Store Instruction (sw):");
        $display("ALUResult: %b, Debug: %b, RegDst: %b, ALUOp: %b, ALUSrc: %b, Branch: %b, MemRead: %b, MemWrite: %b, MemtoReg: %b, RegWrite: %b, PCSrc: %b", 
            ALUResult, Debug, RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite, PCSrc);

        // Test Branch instruction (BEQ)
        Instruction = 32'b000100_00001_00010_00000_00000_000000; // opcode=000100 for beq
        Zero = 1; // Simulate Zero signal for branch to be taken
        #10;
        $display("Branch Instruction (beq):");
        $display("ALUResult: %b, Debug: %b, RegDst: %b, ALUOp: %b, ALUSrc: %b, Branch: %b, MemRead: %b, MemWrite: %b, MemtoReg: %b, RegWrite: %b, PCSrc: %b", 
            ALUResult, Debug, RegDst, ALUOp, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite, PCSrc);

        // Add more tests as necessary...

        // Finish the simulation
        $stop; // Stop the simulation
    end

endmodule
