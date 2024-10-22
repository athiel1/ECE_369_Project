`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members: Megan Zupancic, Annie Thiel
// Overall percent effort of each team meber: Megan - 50%, Annie - 50%
// 
// ECE369A - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction memory. 
//              Decimal value diplayed 
// PCResult: 32-Bit output PCResult from the program counter. 
//              Decimal value diplayed 
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction memory
// outputs the contents of the next instruction indicated by the memory location
// in the PC at every clock cycle. Please initialize the instruction memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////

module stage_IF(PCSrc_IF, AddALU_out_IF, Instruction_IF, PCAdder_out_IF);

    //input Reset, Clk;
    input PCSrc_IF;
    input AddALU_out_IF;
    
    output [31:0] Instruction_IF;
    output [31:0] PCAdder_out_IF;

    wire mux4_result_IF;
    wire [31:0] PCResult_IF;
    
    //wire ClkOut;
    //wire [31:0] PCResult; //do we need to declare this again?

    //Mux32Bit2To1(inA, inB, sel, out);
    Mux32Bit2To1 a1(PCAdder_out_IF, AddALU_out_IF, PCSrc_IF, mux4_result_IF);
    
    //ProgramCounter(Address, PCResult);
    ProgramCounter a2(mux4_result_IF, PCResult_IF);
    
    //PCAdder(PCResult, PCAddResult);
    PCAdder a3(PCResult_IF, PCAdder_out_IF);
    
    //InstructionMemory(Address, Instruction);
    InstructionMemory a4(PCResult_IF, Instruction_IF);
    
endmodule
