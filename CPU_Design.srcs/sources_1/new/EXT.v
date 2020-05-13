`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2020 10:37:52 AM
// Design Name: 
// Module Name: EXT
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


module EXT(Imm16, EXTOp, Imm32 );
    
    input  [15:0] Imm16;   
    input  [1:0]  EXTOp; // EXT_ZERO(2'b00), EXT_SIGNED(2'b01), EXT_HIGHPOS(2'b10)  
    
    output [31:0] Imm32;
    
    wire [31:0] E0, E1, E2;
    wire [15:0] e = {16{Imm16[15]}};
    
    parameter z = 16'b0;
    
    assign E0 = {z, Imm16};
    assign E1 = {e, Imm16};
    assign E2 = {Imm16, z};
    
    function [31:0]ext;
        input [31:0]E0, E1, E2;
        input [1:0]Se;
        case(Se)
            2'b00:ext=E0;
            2'b01:ext=E1;
            2'b10:ext=E2;
        endcase
    endfunction
    
    assign Imm32=ext(E0,E1,E2,EXTOp);
    
endmodule
