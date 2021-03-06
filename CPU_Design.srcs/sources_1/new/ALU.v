`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2020 10:38:08 AM
// Design Name: 
// Module Name: ALU
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


module ALU(A, B, ALUOp, C, Zero);
    
    input   [31:0]  A,B;
    input   [1:0]   ALUOp;
    
    output  [31:0]  C;
    output  reg     Zero;
    
    wire [31:0] C_add, C_sub_, C_or;
    
    function [31:0] AS;
        input [31:0] B;
        input [1:0] ALUOp;
            case(ALUOp)
                2'b00: AS = B;
                2'b01: AS = ~B;
            endcase
    endfunction
    
    function [31:0] S;
        input [31:0] A1, A2;
        input  ALUOp;
            case(ALUOp)
                1'b0: S = A1;
                1'b1: S = A2;
            endcase
    endfunction
    
    CLA_32b CLA_32b(
        .X(A),
        .Y(AS(B,ALUOp)),
        .S(C_add),
        .Cin(ALUOp[0])
    );
    
    assign C_or=A|B;
    assign C=S(C_add,C_or,ALUOp[1]);
    
    initial
        Zero=0;
    
    always @(A,B)
        if(A==B)
            Zero<=1;
        else
            Zero<=0;
    
endmodule
