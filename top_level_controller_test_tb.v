`timescale 1ns / 1ps

module top_level_controller_test_tb;

    // Inputs
    reg Clk;
    reg Rst;
    reg [31:0] Instruction;
    reg [31:0] A, B;

    // Outputs
    wire [31:0] ALUResult;
    wire Zero;
    wire PCSrc;
    wire RegDst, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite;
    wire [1:0] ALUOp;
    wire Debug;

    // Instantiate the top-level module (Controller + ALU + ALUControl)
    top_level_controller_test uut (
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .A(A),
        .B(B),
        .ALUResult(ALUResult),
        .Zero(Zero),
        .PCSrc(PCSrc),
        .RegDst(RegDst),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp),
        .Debug(Debug)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    // Initialize Inputs
    initial begin
        // Apply Reset
        Rst = 1;
        Instruction = 32'b0;
        A = 0;
        B = 0;

        // Wait for a few clock cycles
        #10;
        Rst = 0;

        // Test case 1: ADD (R-type instruction)
        Instruction = 32'b000000_00001_00010_00011_00000_100000;  // add $3, $1, $2
        A = 32'd5;  // $1 = 5
        B = 32'd10; // $2 = 10
        #10;

        // Test case 2: SUB (R-type instruction)
        Instruction = 32'b000000_00001_00010_00011_00000_100010;  // sub $3, $1, $2
        A = 32'd10;
        B = 32'd5;
        #10;

        // Test case 3: AND (R-type instruction)
        Instruction = 32'b000000_00001_00010_00011_00000_100100;  // and $3, $1, $2
        A = 32'b1100;  // $1 = 12
        B = 32'b1010;  // $2 = 10
        #10;

        // Test case 4: LW (I-type instruction)
        Instruction = 32'b100011_00001_00010_0000000000000100;  // lw $2, 4($1)
        A = 32'd4;  // base address
        B = 32'd100; // offset
        #10;

        // Test case 5: BEQ (Branch instruction)
        Instruction = 32'b000100_00001_00010_0000000000000100;  // beq $1, $2, 4
        A = 32'd5;
        B = 32'd5;
        #10;

        // Test case 6: OR (R-type instruction)
        Instruction = 32'b000000_00001_00010_00011_00000_100101;  // or $3, $1, $2
        A = 32'b1100; // $1 = 12
        B = 32'b0011; // $2 = 3
        #10;

        // Test case 7: XORI (I-type instruction)
        Instruction = 32'b001110_00001_00010_0000000000001010;  // xori $2, $1, 10
        A = 32'd15;
        #10;

        // Test case 8: J (jump instruction)
        Instruction = 32'b000010_00000000000000000000000010;  // j 2
        #10;

        // End the simulation
        $finish;
    end

    // Monitor signals during simulation
    initial begin
        $monitor("Time = %0d, Instruction = %b, ALUResult = %d, Zero = %b, PCSrc = %b", 
                 $time, Instruction, ALUResult, Zero, PCSrc);
    end

endmodule
