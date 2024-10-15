module TopLevel (
    input wire Clk,
    input wire Rst,
    input wire [31:0] Instruction,
    input wire Zero,
    
    output wire [31:0] ALUResult,
    output wire ZeroFlag,
    output wire [1:0] ALUOp,
    output wire RegWrite
);

    // Internal signals
    wire RegDst;
    wire ALUSrc;
    wire Branch;
    wire MemRead;
    wire MemWrite;
    wire MemtoReg;
    wire PCSrc;
    wire [5:0] ALUControlSignal;
    wire [31:0] ALUInputA;
    wire [31:0] ALUInputB;

    // Instantiate the Controller
    Controller controller_inst (
        .Clk(Clk),
        .Rst(Rst),
        .Instruction(Instruction),
        .Zero(Zero),
        .RegDst(RegDst),
        .ALUOp(ALUOp),
        .ALUZero(),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .PCSrc()
    );

    // Instantiate the ALU Control
    ALUcontrol alu_control_inst (
        .ALUOp(ALUOp),
        .funct(Instruction[5:0]), // Assuming funct is the last 6 bits of the instruction
        .ALUControl(ALUControlSignal)
    );

    // Instantiate the ALU
    ALU32Bit alu_inst (
        .ALUControl(ALUControlSignal),
        .A(ALUInputA),
        .B(ALUInputB),
        .ALUResult(ALUResult),
        .Zero(ZeroFlag)
    );

    // Logic to drive ALUInputA and ALUInputB from registers or immediate values
    assign ALUInputA = 32'b0; // Connect to the appropriate register data
    assign ALUInputB = ALUSrc ? {16'b0, Instruction[15:0]} : ALUInputA; // Immediate value or register data

endmodule
