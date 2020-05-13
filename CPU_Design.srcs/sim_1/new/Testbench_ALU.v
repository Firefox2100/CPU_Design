`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 09:38:12 AM
// Design Name: 
// Module Name: Testbench_ALU
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


module Testbench_ALU();
    
    reg     [31:0]  A,B;
    reg     [1:0]   ALUOp;
    
    wire    [31:0]  C;
    wire            Zero;
    
    ALU ALU(
        .A(A),
        .B(B),
        .ALUOp(ALUOp),
        .C(C),
        .Zero(Zero)
    );
    
    initial
    begin
        A=277;
        B=135;
        ALUOp=0;
        #20 ALUOp=1;
        #20 ALUOp=2;
    end
    
endmodule
