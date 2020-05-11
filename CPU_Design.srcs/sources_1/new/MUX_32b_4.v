`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 10:01:12 AM
// Design Name: 
// Module Name: MUX_32b_4
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


module MUX_32b_4(A0, A1, A2, A3, S, Y);
    
    input [31:0]    A0, A1, A2, A3;
    input [1:0]     S;
    
    output [31:0]   Y;
    
    function [31:0] select;
        input [31:0] A0, A1, A2, A3;
        input [1:0] S;
            case(S)
                2'b00: select = A0;
                2'b01: select = A1;
                2'b10: select = A2;
                2'b11: select = A3;
            endcase
    endfunction
    
    assign Y = select (A0, A1, A2, A3, S);
endmodule
