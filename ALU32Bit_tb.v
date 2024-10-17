`timescale 1ns / 1ps

module ALU32Bit_tb;

    // Inputs to the ALU
    reg [5:0] ALUControl; 
    reg [31:0] A, B;

    // Outputs from the ALU
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

    // Initialize and simulate inputs
    initial begin

        // Test ADD (A + B)
        A = 32'h00000005; 
        B = 32'h00000003;
        ALUControl = 6'b100000; // ADD
        #10;
        $display("ADD: A = %d, B = %d, Result = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test SUB (A - B)
        A = 32'h00000005; 
        B = 32'h00000005;
        ALUControl = 6'b100010; // SUB
        #10;
        $display("SUB: A = %d, B = %d, Result = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test AND (A & B)
        A = 32'hAAAAAAAA; 
        B = 32'h55555555;
        ALUControl = 6'b100100; // AND
        #10;
        $display("AND: A = %h, B = %h, Result = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test OR (A | B)
        A = 32'hAAAAAAAA; 
        B = 32'h55555555;
        ALUControl = 6'b100101; // OR
        #10;
        $display("OR: A = %h, B = %h, Result = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test NOR ~(A | B)
        A = 32'hAAAAAAAA; 
        B = 32'h55555555;
        ALUControl = 6'b100111; // NOR
        #10;
        $display("NOR: A = %h, B = %h, Result = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test XOR (A ^ B)
        A = 32'hAAAAAAAA; 
        B = 32'h55555555;
        ALUControl = 6'b100110; // XOR
        #10;
        $display("XOR: A = %h, B = %h, Result = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test SLL (Shift Left Logical)
        A = 32'h00000001;
        B = 32'h00000002; // Shift by 2 bits
        ALUControl = 6'b000000; // SLL
        #10;
        $display("SLL: A = %h, B = %d, Result = %h, Zero = %b", A, B[4:0], ALUResult, Zero);

        // Test SRL (Shift Right Logical)
        A = 32'h00000004;
        B = 32'h00000002; // Shift by 2 bits
        ALUControl = 6'b000010; // SRL
        #10;
        $display("SRL: A = %h, B = %d, Result = %h, Zero = %b", A, B[4:0], ALUResult, Zero);

        // Test SLT (Set Less Than)
        A = 32'h00000001; 
        B = 32'h00000002;
        ALUControl = 6'b101010; // SLT
        #10;
        $display("SLT: A = %d, B = %d, Result = %d, Zero = %b", A, B, ALUResult, Zero);

        // Test BEQ (Branch if equal)
        A = 32'h00000005; 
        B = 32'h00000005;
        ALUControl = 6'b000100; // BEQ
        #10;
        $display("BEQ: A = %d, B = %d, Zero = %b", A, B, Zero);

        // Test BNE (Branch if not equal)
        A = 32'h00000005; 
        B = 32'h00000003;
        ALUControl = 6'b000101; // BNE
        #10;
        $display("BNE: A = %d, B = %d, Zero = %b", A, B, Zero);

        // Test J (Jump)
        ALUControl = 6'b000010; // J
        #10;
        $display("J: Result = %h, Zero = %b", ALUResult, Zero);

        // Test JR (Jump Register)
        A = 32'h0000000F; 
        ALUControl = 6'b001000; // JR
        #10;
        $display("JR: A = %h, Result = %h, Zero = %b", A, ALUResult, Zero);

        // Test Store Byte (SB)
        A = 32'h00000010; 
        B = 32'h00000004;
        ALUControl = 6'b101000; // SB
        #10;
        $display("SB: A = %h, B = %h, Result = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test Load Byte (LB)
        A = 32'h00000010; 
        B = 32'h00000004;
        ALUControl = 6'b100000; // LB
        #10;
        $display("LB: A = %h, B = %h, Result = %h, Zero = %b", A, B, ALUResult, Zero);

        // Test BGEZ (Branch if Greater Than or Equal to Zero)
A = 32'h00000005; // A is 5 (>= 0)
ALUControl = 6'b000001; // BGEZ
#10;
$display("BGEZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 1, Zero: 0

A = 32'h00000000; // A is 0 (>= 0)
ALUControl = 6'b000001; // BGEZ
#10;
$display("BGEZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 1, Zero: 0

A = -1; // A is -1 (< 0)
ALUControl = 6'b000001; // BGEZ
#10;
$display("BGEZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 0, Zero: 1

// Test BLTZ (Branch if Less Than Zero)
A = -1; // A is -1 (< 0)
ALUControl = 6'b000011; // BLTZ
#10;
$display("BLTZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 1, Zero: 0

A = 32'h00000000; // A is 0 (>= 0)
ALUControl = 6'b000011; // BLTZ
#10;
$display("BLTZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 0, Zero: 1

A = 32'h00000003; // A is 3 (>= 0)
ALUControl = 6'b000011; // BLTZ
#10;
$display("BLTZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 0, Zero: 1

// Test BGTZ (Branch if Greater Than Zero)
A = 32'h00000001; // A is 1 (> 0)
ALUControl = 6'b000111; // BGTZ
#10;
$display("BGTZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 1, Zero: 0

A = 32'h00000000; // A is 0 (not > 0)
ALUControl = 6'b000111; // BGTZ
#10;
$display("BGTZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 0, Zero: 1

A = -1; // A is -1 (not > 0)
ALUControl = 6'b000111; // BGTZ
#10;
$display("BGTZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 0, Zero: 1

// Test BLEZ (Branch if Less Than or Equal to Zero)
A = -1; // A is -1 (<= 0)
ALUControl = 6'b000110; // BLEZ
#10;
$display("BLEZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 1, Zero: 0

A = 32'h00000000; // A is 0 (<= 0)
ALUControl = 6'b000110; // BLEZ
#10;
$display("BLEZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 1, Zero: 0

A = 32'h00000002; // A is 2 (> 0)
ALUControl = 6'b000110; // BLEZ
#10;
$display("BLEZ: A = %d, Result = %d, Zero = %b", A, ALUResult, Zero);
// Expected: Result = 0, Zero: 1

        // End of test
        $finish;
    end

endmodule



/////////////////EXPECTED RESULT//////////////////////

///////////////////////////////////////////////////////
