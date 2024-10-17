`timescale 1ns / 1ps

module top_tb();

    reg Clk, Rst;
    reg [31:0] Instruction;
    reg Zero;
    reg [1:0] ALUOp;
    reg [5:0] funct, I_op;
    
    wire RegDst, ALUZero, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite, PCSrc, Debug;
    wire [5:0] ALUControl;

    // Instantiate the modules
    Controller uut_controller (
        .Clk(Clk), .Rst(Rst), .Instruction(Instruction), .Zero(Zero),
        .RegDst(RegDst), .ALUOp(ALUOp), .ALUZero(ALUZero), .ALUSrc(ALUSrc),
        .Branch(Branch), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg),
        .RegWrite(RegWrite), .PCSrc(PCSrc), .Debug(Debug)
    );

    ALUControl uut_alu_control (
        .ALUOp(ALUOp), .funct(funct), .I_op(I_op), .ALUControl(ALUControl)
    );

    Branch uut_branch (
        .Branch(Branch), .Zero(Zero), .PCSrc(PCSrc)
    );

    // Clock generation
    always #5 Clk = ~Clk;

    initial begin
        $display("Starting testbench...");

        Clk = 0;
        Rst = 1;
        Zero = 0;
        funct = 6'b0;
        I_op = 6'b0;
        
        // Reset the system
        #10;
        Rst = 0;
        
        // Test R-Type Instruction (ADD)
        Instruction = 32'b000000_00001_00010_00011_00000_100000;  // R-type: ADD $3, $1, $2
        Zero = 0;
        funct = 6'b100000;  // ADD
        ALUOp = 2'b00;
        #10;
        $display("R-Type ADD Instruction:");
        $display("Instruction: %b", Instruction);
        $display("RegDst: %b, ALUOp: %b, ALUSrc: %b, RegWrite: %b, MemRead: %b, MemWrite: %b", RegDst, ALUOp, ALUSrc, RegWrite, MemRead, MemWrite);
        $display("ALUControl: %b", ALUControl);
        $display("---------------------------------------");

        // Test I-Type Instruction (ADDI)
        Instruction = 32'b001000_00001_00010_0000000000001000;  // I-type: ADDI $2, $1, 8
        I_op = 6'b001000;  // ADDI
        ALUOp = 2'b01;
        #10;
        $display("I-Type ADDI Instruction:");
        $display("Instruction: %b", Instruction);
        $display("RegDst: %b, ALUOp: %b, ALUSrc: %b, RegWrite: %b, MemRead: %b, MemWrite: %b", RegDst, ALUOp, ALUSrc, RegWrite, MemRead, MemWrite);
        $display("ALUControl: %b", ALUControl);
        $display("---------------------------------------");

        // Test Branch Instruction (BEQ)
        Instruction = 32'b000100_00001_00010_0000000000000001;  // BEQ $1, $2, offset 1
        Zero = 1;  // Assume $1 == $2 (Zero flag set)
        I_op = 6'b000100;  // BEQ
        ALUOp = 2'b10;
        #10;
        $display("Branch BEQ Instruction:");
        $display("Instruction: %b", Instruction);
        $display("RegDst: %b, ALUOp: %b, ALUSrc: %b, Branch: %b, PCSrc: %b", RegDst, ALUOp, ALUSrc, Branch, PCSrc);
        $display("ALUControl: %b", ALUControl);
        $display("---------------------------------------");

        // Test Load Word (LW)
        Instruction = 32'b100011_00001_00010_0000000000000100;  // LW $2, 4($1)
        I_op = 6'b100011;  // LW
        ALUOp = 2'b01;
        #10;
        $display("Load Word LW Instruction:");
        $display("Instruction: %b", Instruction);
        $display("RegDst: %b, ALUOp: %b, ALUSrc: %b, MemRead: %b, MemWrite: %b, RegWrite: %b", RegDst, ALUOp, ALUSrc, MemRead, MemWrite, RegWrite);
        $display("ALUControl: %b", ALUControl);
        $display("---------------------------------------");

        // Test Store Word (SW)
        Instruction = 32'b101011_00001_00010_0000000000000100;  // SW $2, 4($1)
        I_op = 6'b101011;  // SW
        ALUOp = 2'b01;
        #10;
        $display("Store Word SW Instruction:");
        $display("Instruction: %b", Instruction);
        $display("RegDst: %b, ALUOp: %b, ALUSrc: %b, MemRead: %b, MemWrite: %b, RegWrite: %b", RegDst, ALUOp, ALUSrc, MemRead, MemWrite, RegWrite);
        $display("ALUControl: %b", ALUControl);
        $display("---------------------------------------");

        $finish;
    end
endmodule


///////EXPECTED OUTPUT/////////////////////////////////////////////////
//Starting testbench...
//R-Type ADD Instruction:
//Instruction: 00000000001000100001100000100000
//RegDst: 1, ALUOp: 00, ALUSrc: 0, RegWrite: 1, MemRead: 0, MemWrite: 0
//ALUControl: 100000
//---------------------------------------
//I-Type ADDI Instruction:
//Instruction: 00100000001000100000000000001000
//RegDst: 0, ALUOp: 01, ALUSrc: 1, RegWrite: 1, MemRead: 0, MemWrite: 0
//ALUControl: 100000
//---------------------------------------
//Branch BEQ Instruction:
//Instruction: 00010000001000100000000000000001
//RegDst: 0, ALUOp: 10, ALUSrc: 0, Branch: 1, PCSrc: 1
//ALUControl: 100010
//---------------------------------------
//Load Word LW Instruction:
//Instruction: 10001100001000100000000000000100
//RegDst: 0, ALUOp: 01, ALUSrc: 1, MemRead: 1, MemWrite: 0, RegWrite: 1
//ALUControl: 100000
//---------------------------------------
//Store Word SW Instruction:
//Instruction: 10101100001000100000000000000100
//RegDst: 0, ALUOp: 01, ALUSrc: 1, MemRead: 0, MemWrite: 1, RegWrite: 0
//ALUControl: 100000
//---------------------------------------
//////////////////////////////////////////////////////////////////////////
