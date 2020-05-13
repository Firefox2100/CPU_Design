`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 05:19:02 PM
// Design Name: 
// Module Name: IDEX
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


module IDEX(clk, EN, clrm, condep, stall, ID_RD1, ID_RD2, EX_RD1, EX_RD2 );
    
    input clk;
    input EN;
    input clrm;
    input condep;
    input               stall;
    
    input       [31:0]  ID_RD1;     //Data from RD1 of register file
    input       [31:0]  ID_RD2;     //Data from RD2 of register file
    
    output reg  [31:0]  EX_RD1;
    output reg  [31:0]  EX_RD2;
    
    wire                Safe;
    wire                CL;
    
    assign Safe=EN&~stall;
    assign CL=clrm&~condep;
    
    always @(posedge clk)
    begin
        if(CL)
            {EX_RD1,EX_RD2}<=0;
        else if(Safe)
            {EX_RD1,EX_RD2}<={ID_RD1,ID_RD2};
    end
    
endmodule
