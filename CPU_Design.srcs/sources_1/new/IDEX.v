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


module IDEX(
    clk, EN, clrm, condep, stall,
    ID_RD1, ID_RD2, ID_Extended, ID_BA, ID_J_addr, ID_ADD4, ID_OP, ID_func, ID_RT_RD_Addr, ID_Wreg, ID_Wmem, ID_Aluc, ID_FwdA, ID_FwdB, ID_Aluqb,
    EX_RD1, EX_RD2, EX_Extended, EX_BA, EX_J_addr, EX_ADD4, EX_OP, EX_func, EX_RT_RD_Addr, EX_Wreg, EX_Wmem, EX_Aluc, EX_FwdA, EX_FwdB, EX_Aluqb
    );
    
    input               clk;
    input               EN;
    input               clrm;
    input               condep;
    input               stall;
    
    input       [31:0]  ID_RD1;         //Data from RD1 of register file
    input       [31:0]  ID_RD2;         //Data from RD2 of register file
    input       [31:0]  ID_Extended;    //Data from the extender
    input       [31:0]  ID_BA;          //Data from the branch address calculator
    input       [31:0]  ID_J_addr;      //Data from the jump address combinator
    input       [31:0]  ID_ADD4;        //Data from IFID, originated from PCADD4
    input       [5:0]   ID_OP;          //OP of ID stage
    input       [5:0]   ID_func;        //func of ID stage
    input       [4:0]   ID_RT_RD_Addr;  //Target address from ID
    input       [1:0]   ID_Aluc;        //Control signal to control ALU modes
    input       [1:0]   ID_FwdA;
    input       [1:0]   ID_FwdB;
    input               ID_Aluqb;
    input               ID_Wreg;
    input               ID_Wmem;
    
    output  reg [31:0]  EX_RD1;
    output  reg [31:0]  EX_RD2;
    output  reg [31:0]  EX_Extended;
    output  reg [31:0]  EX_BA;
    output  reg [31:0]  EX_J_addr;
    output  reg [31:0]  EX_ADD4;
    output  reg [5:0]   EX_OP;
    output  reg [5:0]   EX_func;
    output  reg [5:0]   EX_RT_RD_Addr;
    output  reg [1:0]   EX_Aluc;
    output  reg [1:0]   EX_FwdA;
    output  reg [1:0]   EX_FwdB;
    output  reg         EX_Aluqb;
    output  reg         EX_Wreg;
    output  reg         EX_Wmem;
    
    wire                Safe;
    wire                CL;
    
    assign Safe=EN&~stall;
    assign CL=clrm&~condep;
    
    initial
    begin
        
    end
    
    always @(posedge clk)
    begin
        if(CL)
            {EX_RD1,EX_RD2,EX_Extended,EX_BA,EX_J_addr,EX_ADD4,EX_OP,EX_func,EX_RT_RD_Addr,EX_Aluc,EX_FwdA,EX_FwdB,EX_Aluqb,EX_Wreg,EX_Wmem}<=0;
        else if(Safe)
            {EX_RD1,EX_RD2,EX_Extended,EX_BA,EX_J_addr,EX_ADD4,EX_OP,EX_func,EX_RT_RD_Addr,EX_Aluc,EX_FwdA,EX_FwdB,EX_Aluqb,EX_Wreg,EX_Wmem}<=
            {ID_RD1,ID_RD2,ID_Extended,ID_BA,ID_J_addr,ID_ADD4,ID_OP,ID_func,ID_RT_RD_Addr,ID_Aluc,ID_FwdA,ID_FwdB,ID_Aluqb,ID_Wreg,ID_Wmem};
    end
    
endmodule
