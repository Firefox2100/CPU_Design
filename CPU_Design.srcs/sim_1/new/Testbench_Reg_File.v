`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 10:11:52 AM
// Design Name: 
// Module Name: Testbench_Reg_File
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


module Testbench_Reg_File();
    
    reg     [4:0]   A1, A2, A3;
    reg     [31:0]  WD;
    reg             clk;
    reg             RFWr;
    reg             clr;
    
    wire    [31:0]  RD1, RD2;
    
    Reg_File Reg_File(
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .WD(WD),
        .clk(clk),
        .RFWr(RFWr),
        .clr(clr),
        .RD1(RD1),
        .RD2(RD2)
    );
    
    initial
    begin
        clk=0;
        forever #10 clk=~clk;
    end
    
    initial
    begin
        A1=5;
        A2=7;
        A3=5;
        clr=0;
        RFWr=0;
        WD=1246;
        #5 RFWr=1;
        #10 RFWr=0;
        #0 A3=8;
        #10 RFWr=1;
        #10 RFWr=0;
        #0 A2=8;
    end
    
endmodule
