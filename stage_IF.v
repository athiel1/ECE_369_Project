`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2024 09:12:54 AM
// Design Name: 
// Module Name: top_level_lab1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stage_IF(Clk, Reset, out7, en_out);

    input Reset, Clk;
    output [6:0] out7;
    output [7:0] en_out;
    
    wire [31:0] PCResult;
    wire ClkOut;
    wire [31:0] Instruction;
    
    //wire [31:0] PCResult; //do we need to declare this again?
    
    //ClkDiv(Clk, Rst, ClkOut);
    ClkDiv b1(Clk, 0, ClkOut);
    
    //InstructionFetchUnit(Instruction, PCResult, Reset, Clk);
    InstructionFetchUnit b2(Instruction, PCResult, Reset, ClkOut);
    
    //Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
    Two4DigitDisplay b3(Clk, Instruction[15:0], PCResult[15:0], out7, en_out);
    
endmodule




