`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 09:18:16 AM
// Design Name: 
// Module Name: NPC
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


module NPC(PC, NPCOp, IMM, NPC );
    
    input   [31:0]  PC;
    input   [1:0]   NPCOp; // PLUS4(2'b00), BRANCH(2'b01), JUMP(2'b10)
    input   [25:0]  IMM;
    
    output  [31:0]  NPC;
    
    wire    [31:0]  ADD_4,b,j;
    wire    [13:0]  e = {16{IMM[15]}};
    
    ADD_4_PC ADD_4_PC(
        .in(PC),
        .out(ADD_4)
    );
    
    CLA_32b CLA_b(
        .X(ADD_4),
        .Y({e,IMM[15:0],2'b00}),
        .S(b),
        .Cin(2'b0)
    );
    
    CLA_32b CLA_j(
        .X(ADD_4),
        .Y({4'b0000,IMM,2'b00}),
        .S(j),
        .Cin(2'b0)
    );
    
    function [31:0] select;
        input [31:0] A0, A1, A2;
        input [1:0] S;
            case(S)
                2'b00: select = A0;
                2'b01: select = A1;
                2'b10: select = A2;
            endcase
    endfunction
    
    assign NPC=select(ADD_4,b,j,NPCOp);
    
endmodule
