`timescale 1ns / 1ps

module ALU32Bit_tb;

    // Inputs
    reg [5:0] ALUControl;
    reg [31:0] A;
    reg [31:0] B;

    // Outputs
    wire [31:0] ALUResult;
    wire Zero;

    // Instantiate the ALU32Bit module
    ALU32Bit uut (
        .ALUControl(ALUControl),
        .A(A),
        .B(B),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    // Test cases
    initial begin
        // Test Case 1: ADD (A + B)
        A = 32'h00000010; // A = 16
        B = 32'h00000020; // B = 32
        ALUControl = 6'b100000; // ADD operation
        #10;
        $display("ADD: A = %d, B = %d, ALUResult = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 2: SUB (A - B)
        A = 32'h00000030; // A = 48
        B = 32'h00000020; // B = 32
        ALUControl = 6'b100010; // SUB operation
        #10;
        $display("SUB: A = %d, B = %d, ALUResult = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 3: MUL (A * B)
        A = 32'h00000004; // A = 4
        B = 32'h00000003; // B = 3
        ALUControl = 6'b011000; // MUL operation
        #10;
        $display("MUL: A = %d, B = %d, ALUResult = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 4: AND (A & B)
        A = 32'hFFFFFFFF; // A = -1 (All bits set)
        B = 32'h0000000F; // B = 15
        ALUControl = 6'b100100; // AND operation
        #10;
        $display("AND: A = %h, B = %h, ALUResult = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 5: OR (A | B)
        A = 32'h0000FFFF; // A = 65535
        B = 32'hFFFF0000; // B = -65536
        ALUControl = 6'b100101; // OR operation
        #10;
        $display("OR: A = %h, B = %h, ALUResult = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 6: SLL (Shift Left Logical)
        A = 32'h00000001; // A = 1
        B = 32'h00000002; // Shift by 2
        ALUControl = 6'b000000; // SLL operation
        #10;
        $display("SLL: A = %h, B = %h, ALUResult = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 7: SRL (Shift Right Logical)
        A = 32'h00000008; // A = 8
        B = 32'h00000002; // Shift by 2
        ALUControl = 6'b000010; // SRL operation
        #10;
        $display("SRL: A = %h, B = %h, ALUResult = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 8: NOR (A NOR B)
        A = 32'h0000000F; // A = 15
        B = 32'h000000F0; // B = 240
        ALUControl = 6'b100111; // NOR operation
        #10;
        $display("NOR: A = %h, B = %h, ALUResult = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 9: XOR (A ^ B)
        A = 32'hF0F0F0F0; // A = some pattern
        B = 32'h0F0F0F0F; // B = some complementary pattern
        ALUControl = 6'b100110; // XOR operation
        #10;
        $display("XOR: A = %h, B = %h, ALUResult = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test Case 10: Default (Invalid ALUControl)
        A = 32'h12345678; // A = some arbitrary value
        B = 32'h87654321; // B = some arbitrary value
        ALUControl = 6'b111111; // Invalid operation
        #10;
        $display("DEFAULT: A = %h, B = %h, ALUResult = %h, Zero = %b", A, B, ALUResult, Zero);

        // End of test
        $finish;
    end

endmodule
