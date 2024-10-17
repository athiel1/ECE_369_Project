`timescale 1ns / 1ps

module TopModule_tb;

    reg Clk;
    reg Rst;
    reg [31:0] Instruction;
    reg Zero;
    
    wire [5:0] ALUControlSignal;
    wire PCSrc;
    wire Debug;

    // Instantiate the top module
    TopModule uut (
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .Zero(Zero),
        .ALUControlSignal(ALUControlSignal),
        .PCSrc(PCSrc),
        .Debug(Debug)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        Rst = 1;
        Instruction = 32'b000000_00000_00000_00000_00000_100000;  // ADD instruction (R-type)
        Zero = 0;

        #10;  // Wait for 10ns

        Rst = 0;  // Release reset

        #10;
        // Test R-type ADD instruction
        Instruction = 32'b000000_00001_00010_00011_00000_100000;  // ADD
        Zero = 0;
        #20;
        
        // Test BEQ instruction (Branch instruction)
        Instruction = 32'b000100_00001_00010_00000_00000_000000;  // BEQ
        Zero = 1;  // Simulate branch taken
        #20;
        
        // Test I-type ADDI instruction
        Instruction = 32'b001000_00001_00010_00000_00000_000101;  // ADDI
        Zero = 0;
        #20;

        $stop;
    end

endmodule
