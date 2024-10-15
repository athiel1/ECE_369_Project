`timescale 1ns / 1ps

module ALUControl(ALUOp, funct, ALUControl);
  input [1:0] ALUOp;
  input [5:0] funct;

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
        endcase
      end

      2'b01: begin // SW and LW instructions
        ALUControl = 6'b100000;
      end

      2'b10: begin
        ALUControl = 6'b100010;
      end
    endcase
        
  end

endmodule
