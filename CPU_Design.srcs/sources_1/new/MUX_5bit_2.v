`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 04:51:05 PM
// Design Name: 
// Module Name: MUX_5bit_2
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


module MUX_5bit_2(A0, A1, Y, S );
    
    input   [4:0]   A0;
    input   [4:0]   A1;
    input           S;
    
    output  [4:0]   Y;
    
    function [4:0] select;
        input [4:0] A0, A1;
        input S;
            case(S)
                1'b0: select = A0;
                1'b1: select = A1;
            endcase
    endfunction
    
    assign Y=select(A0,A1,S);
    
endmodule
