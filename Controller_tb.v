`timescale 1ns / 1ps

module Controller_tb;

    // Inputs
    reg Clk;
    reg Rst;
    reg [31:0] Instruction;
    reg Zero;

    // Outputs
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
    Controller uut (
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
        .PCSrc(PCSrc)
    );

    // Clock Generation
    always #5 Clk = ~Clk;

initial begin
    // Initialize Inputs
    Clk = 0;
    Rst = 1;
    Instruction = 32'b0;
    Zero = 0;

    // Test Reset Behavior
    #10;
    Rst = 0; // Release reset
    #10;

    // Test R-Type instruction (e.g., add)
    Instruction = 32'b000000_00000_00000_00000_00000_100000; // R-type (funct=100000 for ADD)
    #10;
    $display("R-Type Instruction:");
    $display("Debug Signal: %b", uut.Debug);
    // Other $display statements...

    // Test with an invalid instruction
    Instruction = 32'b111111_11111_11111_11111_11111_111111; // Invalid opcode
    #10;
    $display("Invalid Instruction:");
    $display("Debug Signal: %b", uut.Debug);

    // Finish the simulation
    $stop;
end

endmodule
