`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0

    /* Please fill in the implementation here... */

	// Add: add, addi, lw, sw, sb, lh, lb, sh
	// Subtract: sub, beq, bne, slt, slti
	// Multiply: mul
	// Branch if greater than or equal to zero: bgez
	// Branch on greater than zero: bgtz
	// Branch on less than or equal to zero: blez
	// Branch on less than zero: bltz
	// Logical ands: and, andi
	// Logical or: or, ori
	// Logical nor: nor
	// Logical xor: xor, xori
	// Shift left logical: sll
	// Shift right logical: srl

	always @(ALUControl, A, B) begin
		case (ALUControl)
			4'b0000: // ADD 
				ALUResult <= A + B;
			4'b0001: // SUB
				ALUResult <= A - B;  // might have to change
			4'b0010: // MUL
				ALUResult <= A * B;
			4'b0011: // bgez
				ALUResult = (A >= 0) ? 1 : 0;
			4'b0100: // bgtz
				ALUResult = (A > 0) ? 1 : 0;
			4'b0101: // blez
				ALUResult = (A <= 0) ? 1 : 0;
			4'b0110: // bltz
				ALUResult = (A < 0) ? 1 : 0;
			4'b0111: // AND
				ALUResult <= A & B;
			4'b1000: // OR
				ALUResult <= A | B;
			4'b1001: // NOR
				ALUResult <= ~(A | B);
			4'b1010: // XOR
				ALUResult <= A ^ B;
			4'b1011: // sll
				ALUResult <= A << (B);
			4'b1111: // srl
				ALUResult <= A >> (B);	
		endcase
			
	end

	always @(ALUResult) begin
		Zero = (ALUResult == 0) ? 1 : 0;
	end

endmodule





			

