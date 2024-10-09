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


module controller(Clk, Rst, Instruction, ALUControl);
    input wire Clk;
    input wire Rst;
    input [31:0] Instruction;
    
    wire ALUOp; 
    wire EX_enable;
    wire MEM_enable;
    wire WB_enable;
    
    output reg ALUControl;
    // ALU Controller / ALUOp ??
    

    assign EX_enable = 0;
    assign MEM_enable = 0;
    assign WB_enable = 0;
    
    always @(posedge Clk) begin
        if (Rst) begin
           assign EX_enable = 0;
           assign MEM_enable = 0;
           assign WB_enable = 0; 
        end
    end
    
    always @(Instruction) begin
        case (Instruction[31:26]) 
            5'b00000: // R-Type
                EX_enable <= 1;
        endcase
    end


endmodule




