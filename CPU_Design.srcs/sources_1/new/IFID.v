`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 10:05:59 AM
// Design Name: 
// Module Name: IFID
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


module IFID(IF_ADD4, IF_Inst, En, Clk, Clrn, ID_ADD4, ID_Inst, stall, condep );
    
    input       [31:0]  IF_ADD4;
    input       [31:0]  IF_Inst;
    input               En;
    input               Clk;
    input               Clrn;
    input               stall;
    input               condep;
    
    output  reg [31:0]  ID_ADD4;
    output  reg [31:0]  ID_Inst;
    
    wire            Safe;
    wire            CL;
    
    assign Safe=En&~stall;
    assign CL=Clrn&~condep;
    
    initial
    begin
        ID_ADD4=0;
        ID_Inst=0;
    end
    
    always @(posedge Clk)
    begin
        if(!CL)
            ID_ADD4<=0;
        else if(Safe)
            ID_ADD4<=IF_ADD4;
    end
    
    always @(posedge Clk)
    begin
        if(!CL)
            ID_Inst<=0;
        else if(Safe)
            ID_Inst<=IF_Inst;
    end
    
endmodule
