`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit2To1(inA, inB, sel, out);
    
    input [31:0] inA;
    input [31:0] inB;
    input sel;

    output reg [31:0] out;
    
    // assign out = sel? inB: inA;   for this line, no reg in line 12
    always @(inA, inB) begin

        if (sel == 0) begin
            out <= inA;
        end 
        if (sel == 1) begin
            out <= inB;
        end
    
    end
    
endmodule
