`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 08:38:32 AM
// Design Name: 
// Module Name: Testbench_CLA_32b
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


module Testbench_CLA_32b();
    
    reg [31:0] A,B;
    reg cin;
    wire [31:0] S;
    wire cout;
    
    CLA_32b CLA_32b(
        .X(A),
        .Y(B),
        .S(S),
        .Cin(cin),
        .Cout(cout)
    );
    
    initial
    begin
    A=20;
    B=48;
    cin=0;
    end
    
endmodule
