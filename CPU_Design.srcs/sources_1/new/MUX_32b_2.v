`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 10:39:56 PM
// Design Name: 
// Module Name: MUX_32b_2
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


module MUX_32b_2(A0, A1, S, Y);
    
    input   [31:0]  A0, A1;
    input           S;
    
    output  [31:0]  Y;
    
    function [31:0] select;
        input [31:0] A0, A1;
        input        S;
            case(S)
                1'b0: select = A0;
                1'b1: select = A1;
            endcase
    endfunction
    
    assign Y = select (A0, A1, S);
    
endmodule
