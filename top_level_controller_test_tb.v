`timescale 1ns / 1ps

module top_level_controller_test_tb;

    // Parameters
    reg Clk;
    reg Rst;
    reg [31:0] Instruction;
    reg Zero;
    
    // Outputs
    wire [1:0] ALUOp;
    wire ALUSrc;
    wire RegWrite;
    wire [5:0] ALUControl;

    // Instantiate the MiniTopLevel
    top_level_controller_test uut (
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .Zero(Zero),
        .ALUOp(ALUOp),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUControl(ALUControl)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        Rst = 1;
        Instruction = 32'b0;
        Zero = 0;

        // Wait for a few clock cycles
        #15;
        
        // Release reset
        Rst = 0;
        
        // Test R-Type instruction (ADD)
        Instruction = 32'b000000_00001_00010_00011_00000_100000; // ADD R3, R1, R2
        #10;
        display_outputs();

        // Test Load instruction
        Instruction = 32'b100011_00001_00010_0000000000000000; // LW R2, 0(R1)
        #10;
        display_outputs();

        // Test Store instruction
        Instruction = 32'b101011_00001_00010_0000000000000000; // SW R2, 0(R1)
        #10;
        display_outputs();

        // Test Branch instruction
        Instruction = 32'b000100_00001_00010_0000000000000100; // BEQ R1, R2, 4
        #10;
        display_outputs();

        // End simulation
        $finish;
    end

    // Task to display outputs
    task display_outputs;
        begin
            $display("Time: %0t | ALUOp: %b | ALUSrc: %b | RegWrite: %b | ALUControl: %b", 
                     $time, ALUOp, ALUSrc, RegWrite, ALUControl);
        end
    endtask

endmodule
