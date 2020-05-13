`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 06:40:57 PM
// Design Name: 
// Module Name: Testbench_PC
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


module Testbench_PC();
    
    reg     [31:0]  NPC;
    reg             clk;
    reg             PCWr;
    reg             Clrn;
    reg             stall;
    
    wire    [31:0]  PCW;
    
    PC PC(
        .NPC(NPC),
        .clk(clk),
        .PCWr(PCWr),
        .Clrn(Clrn),
        .PC(PCW),
        .stall(stall)
    );
    
    initial
    begin
        NPC=0;
        PCWr=1;
        Clrn=1;
        stall=0;
        #5 NPC=1568;
        #20 NPC=1246;
        #20 NPC=1149;
        #0 stall=1;
        #20 stall=0;
    end
    
    initial
    begin
        clk=0;
        forever #10 clk=~clk;
    end
    
endmodule
