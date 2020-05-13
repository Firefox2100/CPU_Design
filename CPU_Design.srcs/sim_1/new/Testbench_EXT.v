`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 06:42:38 PM
// Design Name: 
// Module Name: Testbench_EXT
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


module Testbench_EXT();
    
    reg     [15:0] Imm16;   
    reg     [1:0]  EXTOp;
    
    wire    [31:0] Imm32;
    
    EXT EXT(
        .Imm16(Imm16),
        .EXTOp(EXTOp),
        .Imm32(Imm32)
    );
    
    initial
    begin
        Imm16=16'b1001101001100111;
        EXTOp=0;
        #20 EXTOp=1;
        #20 EXTOp=2;
    end
    
endmodule
