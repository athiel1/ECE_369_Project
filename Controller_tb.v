`timescale 1ns / 1ps

module controller_tb;

    // Inputs
    reg Clk;
    reg Rst;
    reg [31:0] Instruction;

    // Outputs
    wire RegDst;
    wire ALUOp;
    wire ALUZero;
    wire ALUSrc;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire RegWrite;
    wire PCSrc;
    wire MemWrite;

    // Instantiate the Unit Under Test (UUT)
    controller uut (
        .Clk(Clk), 
        .Rst(Rst), 
        .Instruction(Instruction), 
        .RegDst(RegDst),
        .ALUOp(ALUOp),
        .ALUZero(ALUZero),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .PCSrc(PCSrc),
        .MemWrite(MemWrite)
    );

    // Clock generation
    always #5 Clk = ~Clk;  // Toggle clock every 5 ns (10 ns clock period)

    initial begin
        // Initialize Inputs
        Clk = 0;
        Rst = 1;
        Instruction = 32'b0;  // No operation initially

        // Reset the controller
        #10;
        Rst = 0;

        // Test R-Type instruction (opcode = 0)
        Instruction = 32'b000000_00001_00010_00011_00000_100000;  // Example R-type ADD instruction
        #10;
        $display("R-Type ADD Instruction - RegDst: %b, ALUOp: %b, RegWrite: %b", RegDst, ALUOp, RegWrite);

        // Test Load Word (lw) instruction (opcode = 100011)
        Instruction = 32'b100011_00001_00010_0000000000000100;  // lw $2, 4($1)
        #10;
        $display("Load Word (lw) Instruction - MemRead: %b, ALUSrc: %b, MemtoReg: %b, RegWrite: %b", MemRead, ALUSrc, MemtoReg, RegWrite);

        // Test Store Word (sw) instruction (opcode = 101011)
        Instruction = 32'b101011_00001_00010_0000000000000100;  // sw $2, 4($1)
        #10;
        $display("Store Word (sw) Instruction - MemWrite: %b, ALUSrc: %b, RegWrite: %b", MemWrite, ALUSrc, RegWrite);

        // Test Branch Equal (beq) instruction (opcode = 000100)
        Instruction = 32'b000100_00001_00010_0000000000000010;  // beq $1, $2, offset = 2
        #10;
        $display("Branch Equal (beq) Instruction - Branch: %b, ALUZero: %b, PCSrc: %b", Branch, ALUZero, PCSrc);

        // Test Reset functionality
        #10;
        Rst = 1;
        #10;
        $display("After Reset - RegWrite: %b, MemRead: %b, MemWrite: %b, Branch: %b", RegWrite, MemRead, MemWrite, Branch);
        Rst = 0;

        // Finish simulation
        #10;
        $finish;
    end

endmodule

