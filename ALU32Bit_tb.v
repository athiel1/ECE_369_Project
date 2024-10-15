`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [5:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );

	initial begin
	
    /* Please fill in the implementation here... */

		// Test cases

        // Test ADD
        A = 32'h0000000A; // 10
        B = 32'h00000005; // 5
        ALUControl = 6'b000000; // ADD
        #10;
        $display("ADD: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Test SUB
        ALUControl = 6'100010; // SUB
        #10;
        $display("SUB: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Test MUL
        ALUControl = 6'b011000; // MUL
        #10;
        $display("MUL: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Test AND
        ALUControl = 6'b100100; // AND
        #10;
        $display("AND: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Test OR
        ALUControl = 6'b100101; // OR
        #10;
        $display("OR: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Test XOR
        ALUControl = 6'b100110; // XOR
        #10;
        $display("XOR: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Test SLL
        A = 32'h00000001; // 1
        B = 32'h00000002; // Shift left by 2
        ALUControl = 6'b000000; // SLL
        #10;
        $display("SLL: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Test SRL
        A = 32'h00000004; // 4
        B = 32'h00000001; // Shift right by 1
        ALUControl = 6'b000010; // SRL
        #10;
        $display("SRL: A=%h, B=%h, ALUResult=%h, Zero=%b", A, B, ALUResult, Zero);

        // Finish the simulation
        $finish;
	
	end

endmodule

