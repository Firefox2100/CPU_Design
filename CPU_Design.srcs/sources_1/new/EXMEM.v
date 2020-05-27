`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 11:05:36 PM
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(
    En, Clk, Clrn,
    EX_ALU_R,  EX_RD2,  EX_RT_RD_Addr,  EX_Wreg,  EX_Reg2reg,  EX_Wmem,
    MEM_ALU_R, MEM_RD2, MEM_RT_RD_Addr, MEM_Wreg, MEM_Reg2reg, MEM_Wmem
    );
    
    input               En;
    input               Clk;
    input               Clrn;
    
    input       [31:0]  EX_ALU_R;
    input       [31:0]  EX_RD2;
    input       [4:0]   EX_RT_RD_Addr;
    input               EX_Wreg;
    input               EX_Reg2reg;
    input               EX_Wmem;
    
    output  reg [31:0]  MEM_ALU_R;
    output  reg [31:0]  MEM_RD2;
    output  reg [31:0]  MEM_RT_RD_Addr;
    output  reg         MEM_Wreg;
    output  reg         MEM_Reg2reg;
    output  reg         MEM_Wmem;
    
    initial
    begin
        {MEM_ALU_R,MEM_RD2,MEM_RT_RD_Addr,MEM_Wreg,MEM_Reg2reg,MEM_Wmem}=0;
    end
    
    always @(posedge Clk)
    begin
        if(Clrn)
            {MEM_ALU_R,MEM_RD2,MEM_RT_RD_Addr,MEM_Wreg,MEM_Reg2reg,MEM_Wmem}<=0;
        else if(En)
            {MEM_ALU_R,MEM_RD2,MEM_RT_RD_Addr,MEM_Wreg,MEM_Reg2reg,MEM_Wmem}<=
            {EX_ALU_R, EX_RD2, EX_RT_RD_Addr, EX_Wreg, EX_Reg2reg, EX_Wmem};
    end
    
    
endmodule
