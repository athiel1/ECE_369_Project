`timescale 1ns / 1ps

module ALUControl(ALUOp, funct, I_op, ALUControl);
  input [1:0] ALUOp;
  input [5:0] funct;
  input [5:0] I_op;

  output reg [5:0] ALUControl;

  always @(ALUOp, funct) begin
    case(ALUOp)
      2'b00: begin  // R-type instructions
        case (funct)
          6'b100000: // ADD 
              ALUControl = 6'b100000;
	  6'b100010: // SUB
              ALUControl = 6'b100010;
	  6'b011000: // MUL
              ALUControl = 6'b011000;
	  6'b100100: // AND
              ALUControl = 6'b100100;
	  6'b100101: // OR
              ALUControl = 6'b100101;
	  6'b100111: // NOR
              ALUControl = 6'b100111;
	  6'b100110: // XOR
              ALUControl = 6'b100110;
	  6'b000000: // sll
              ALUControl = 6'b000000;
	  6'b000010: // srl
              ALUControl = 6'b000010;
          6'b101010: // slt
	      ALUControl = 6'b101010;
	  6'b001000: // jr
	      ALUControl = 6'b001000;
        endcase
      end

      2'b01: begin // I-type instructions
	  case(I_op)
		  6'b101011: // SW
			  ALUControl = 6'b100000;
		  6'b100011: // LW
			  ALUControl = 6'b100000;
		  6'b001000: // ADDI
			  ALUControl = 6'b100000;
		  6'b001100: // ANDI
			  ALUControl = 6'b100100;
		  6'b001101: // ORI
			  ALUControl = 6'b100101;
		  6'b001110: // XORI
			  ALUControl = 6'b100101;
		  6'b001010: // SLTI //
			  ALUControl = 6'b101010;
		  6'b101000: // Store byte
			  ALUControl = 6'b101000;
   		  6'b100000: // Load byte
			  ALUControl = 6'b100000;
		  6'b101001: // Store half
			  ALUControl = 6'b101001;
		  6'b100001: // Load half
			  ALUControl = 6'b100001;
		  6'b000001: // BLTZ & BGEZ //
			  ALUControl = 6'b000001;
		  6'b000100: // BEQ
			  ALUControl = 6'b000001;
		  6'b000101: // BNE
			  ALUControl = 6'b000001;
		  6'b000111: // BGTZ
			  ALUControl = 6'b000001;
		  6'b000110: // BLEZ
			  ALUControl = 6'b000001;
		  6'b000010: // J
			  ALUControl = 6'b000001;
		  6'b000011: // JAL
			  ALUControl = 6'b000001;
	  endcase
      end

      2'b10: begin  // branch instruction
          ALUControl = 6'b100010;
      end

    endcase
        
  end

endmodule
