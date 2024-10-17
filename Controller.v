`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 05:34:15 PM
// Design Name: 
// Module Name: controller
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


module Controller(Clk, Rst, Instruction, RegDst, ALUOp, ALUZero, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, RegWrite, PCSrc, Debug);
    input wire Clk;
    input wire Rst;
    input [31:0] Instruction;
    //input Zero; might become isEqual later 

    
    
    output reg RegDst;
    output reg [1:0] ALUOp;
    output reg ALUZero; // ??
    output reg ALUSrc;
    output reg Branch;
    output reg MemRead;
    output reg MemWrite;
    output reg MemtoReg;
    output reg RegWrite;
    output reg PCSrc;
    output reg Debug;

    wire [5:0] operation;
    assign operation = Instruction[31:26];
    

    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            RegDst <= 0;
            ALUOp <= 2'b00;
            ALUZero <= 0;
            ALUSrc <= 0;
            Branch <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            MemtoReg <= 0;
            RegWrite <= 0;
            PCSrc <= 0;
            Debug <= 0;
        end 
        else begin
            RegDst <= 0;
            ALUOp <= 2'b00;
            ALUZero <= 0;
            ALUSrc <= 0;
            Branch <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            MemtoReg <= 0;
            RegWrite <= 0;
            PCSrc <= 0;
            Debug <= 0;     
    

        $display("operation: %b", operation);
    
            case (Instruction[31:26]) 
                6'b000000: begin // R-Type
                    RegDst <= 1;
                    ALUOp <= 2'b00;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 0;
                    Branch <= 0;      
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;
                    MemtoReg <= 1;
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b001000: begin // ADDI
                    RegDst <= 0;      // result goes to register rt [20:16]
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;      // takes the 'imm' value at the mux
                    Branch <= 0;      
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;
                    MemtoReg <= 1;
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b001100: begin // ANDI
                    RegDst <= 0;      // result goes to register rt [20:16]
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;      // takes the 'imm' value at the mux
                    Branch <= 0;      
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;
                    MemtoReg <= 1;
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b001101: begin // ORI
                    RegDst <= 0;      // result goes to register rt [20:16]
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;      // takes the 'imm' value at the mux
                    Branch <= 0;      
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;
                    MemtoReg <= 1;
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b001110: begin // XORI
                    RegDst <= 0;      // result goes to register rt [20:16]
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;      // takes the 'imm' value at the mux
                    Branch <= 0;      
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;
                    MemtoReg <= 1;
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b100011: begin // Load
                    RegDst <= 0;
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;
                    Branch <= 0;      
                    MemRead <= 1;
                    MemWrite <= 0;
                    MemtoReg <= 0;  
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b101011: begin // Store
                    RegDst <= 0;
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;
                    Branch <= 0;      //doesn't matter
                    MemRead <= 0;
                    MemWrite <= 1;
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b101000: begin // Store Byte
                    RegDst <= 0;
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;
                    Branch <= 0;      //doesn't matter
                    MemRead <= 0;
                    MemWrite <= 1;
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b100000: begin // Load Byte
                    RegDst <= 0;
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;
                    Branch <= 0;      
                    MemRead <= 1;
                    MemWrite <= 0;
                    MemtoReg <= 0;  
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b101001: begin // Store half
                    RegDst <= 0;
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;
                    Branch <= 0;      //doesn't matter
                    MemRead <= 0;
                    MemWrite <= 1;
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b100001: begin // Load half
                    RegDst <= 0;
                    ALUOp <= 2'b01;
                    //ALUZero <= 0;     //doesn't matter
                    ALUSrc <= 1;
                    Branch <= 0;      
                    MemRead <= 1;
                    MemWrite <= 0;
                    MemtoReg <= 0;  
                    RegWrite <= 1;
                    //PCSrc <= 0;       //doesn't matter
                end
                6'b000001: begin // BGEZ & BLTZ
                    RegDst <= 0;
                    ALUOp <= 2'b10;
                    //ALUZero <= 1;     
                    ALUSrc <= 2;      //want to compare to 0
                    Branch <= 1;     
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;    //has to be 0 so we don't overwrite
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;    //has to be zero so we don't overwrite
                    //PCSrc <= Branch & Zero;       
                end
                6'b000100: begin // BEQ
                    RegDst <= 0;
                    ALUOp <= 2'b10;
                    //ALUZero <= 1;     
                    ALUSrc <= 0;      
                    Branch <= 1;     
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;    //has to be 0 so we don't overwrite
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;    //has to be zero so we don't overwrite
                    //PCSrc <= Branch & Zero;       
                end
                6'b000101: begin // BNE
                    RegDst <= 0;
                    ALUOp <= 2'b10;
                    //ALUZero <= 1;     
                    ALUSrc <= 0;      
                    Branch <= 1;     
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;    //has to be 0 so we don't overwrite
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;    //has to be zero so we don't overwrite
                    //PCSrc <= Branch & Zero;       
                end
                6'b000111: begin // BGTZ
                    RegDst <= 0;
                    ALUOp <= 2'b10;
                    //ALUZero <= 1;     
                    ALUSrc <= 2;      //want to compare to 0     
                    Branch <= 1;     
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;    //has to be 0 so we don't overwrite
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;    //has to be zero so we don't overwrite
                    //PCSrc <= Branch & Zero;       
                end
                6'b000110: begin // BLEZ
                    RegDst <= 0;
                    ALUOp <= 2'b10;
                    //ALUZero <= 1;     
                    ALUSrc <= 2;      //want to compare to 0      
                    Branch <= 1;     
                    MemRead <= 0;     //doesn't matter
                    MemWrite <= 0;    //has to be 0 so we don't overwrite
                    MemtoReg <= 0;    //doesn't matter
                    RegWrite <= 0;    //has to be zero so we don't overwrite
                    //PCSrc <= Branch & Zero;       
                end
                
                //FIXME: add instructions for j, jr, jal
                
                default: begin
                    Debug = 1;
                end
            endcase
        end
    end


endmodule
