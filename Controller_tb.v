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
