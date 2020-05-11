`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/15 08:57:22
// Design Name: 
// Module Name: CLA
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


module CLA(A,B,S,cin,cout);
    input [0:7] A;
    input [0:7] B;
    input cin;
    output [0:7] S;
    output cout;
    wire p[0:7];
    wire g[0:7];
    wire c[1:7];
    full_adder u1(
        .a(A[0]),
        .b(B[0]),
        .c(cin),
        .s(S[0]),
        .p(p[0]),
        .g(g[0]));
     assign c[1]=g[0]|(p[0]&cin);
     full_adder u2(
        .a(A[1]),
        .b(B[1]),
        .c(c[1]),
        .s(S[1]),
        .p(p[1]),
        .g(g[1]));
     assign c[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cin);
     full_adder u3(
        .a(A[2]),
        .b(B[2]),
        .c(c[2]),
        .s(S[2]),
        .p(p[2]),
        .g(g[2]));
     assign c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);
     full_adder u4(
        .a(A[3]),
        .b(B[3]),
        .c(c[3]),
        .s(S[3]),
        .p(p[3]),
        .g(g[3]));
     assign c[4]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&cin);
     full_adder u5(
        .a(A[4]),
        .b(B[4]),
        .c(c[4]),
        .s(S[4]),
        .p(p[4]),
        .g(g[4]));
     assign c[5]=g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&p[0]&cin);
     full_adder u6(
        .a(A[5]),
        .b(B[5]),
        .c(c[5]),
        .s(S[5]),
        .p(p[5]),
        .g(g[5]));
     assign c[6]=g[5]|(p[5]&g[4])|(p[5]&p[4]&g[3])|(p[5]&p[4]&p[3]&g[2])|(p[5]&p[4]&p[3]&p[2]&g[1])|(p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&cin);
     full_adder u7(
        .a(A[6]),
        .b(B[6]),
        .c(c[6]),
        .s(S[6]),
        .p(p[6]),
        .g(g[6]));
     assign c[7]=g[6]|(p[6]&g[5])|(p[6]&p[5]&g[4])|(p[6]&p[5]&p[4]&g[3])|(p[6]&p[5]&p[4]&p[3]&g[2])|(p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&cin);
     full_adder u8(
        .a(A[7]),
        .b(B[7]),
        .c(c[7]),
        .s(S[7]),
        .p(p[7]),
        .g(g[7]));
     assign cout=g[7]|(p[7]&g[6])|(p[7]&p[6]&g[5])|(p[7]&p[6]&p[5]&g[4])|(p[7]&p[6]&p[5]&p[4]&g[3])|(p[7]&p[6]&p[5]&p[4]&p[3]&g[2])|(p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|(p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|(p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&cin);
endmodule
