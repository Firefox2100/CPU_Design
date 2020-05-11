`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2020 01:51:46 PM
// Design Name: 
// Module Name: CLA_32b
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


module CLA_32b(A, B, S, cin, cout );

    input [31:0] A,B;
    input cin;
    
    output [31:0] S;
    output cout;
    
    wire [2:0]c;
    
    CLA CLA_1(
        .A(A[7:0]),
        .B(B[7:0]),
        .S(S[7:0]),
        .cin(cin),
        .cout(c[0])
    );
    
    CLA CLA_2(
        .A(A[15:8]),
        .B(B[15:8]),
        .S(S[15:8]),
        .cin(c[0]),
        .cout(c[1])
    );
    
    CLA CLA_3(
        .A(A[23:16]),
        .B(B[23:16]),
        .S(S[23:16]),
        .cin(c[1]),
        .cout(c[2])
    );
    
    CLA CLA_4(
        .A(A[31:24]),
        .B(B[31:24]),
        .S(S[31:24]),
        .cin(c[2]),
        .cout(cout)
    );
    
endmodule
