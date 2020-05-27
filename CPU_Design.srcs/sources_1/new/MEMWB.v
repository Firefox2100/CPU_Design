`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2020 09:39:35 AM
// Design Name: 
// Module Name: MEMWB
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


module MEMWB(
    En, Clk, Clrn,
    MEM_Wreg, MEM_DMO, MEM_Reg2reg, MEM_ALU_R, MEM_RT_RD_Addr,
    WB_Wreg,  WB_DMO,  WB_Reg2reg,  WB_ALU_R,  WB_RT_RD_Addr
    );
    
    input               En;
    input               Clk;
    input               Clrn;
    
    input       [31:0]  MEM_ALU_R;
    input       [31:0]  MEM_DMO;
    input       [4:0]   MEM_RT_RD_Addr;
    input               MEM_Wreg;
    input               MEM_Reg2reg;
    
    output  reg [31:0]  WB_ALU_R;
    output  reg [31:0]  WB_DMO;
    output  reg [4:0]   WB_RT_RD_Addr;
    output  reg         WB_Wreg;
    output  reg         WB_Reg2reg;
    
    initial
    begin
        
    end
    
    always @(posedge Clk)
    begin
        if(Clrn)
            {WB_Wreg, WB_Reg2reg, WB_ALU_R, WB_DMO, WB_RT_RD_Addr}<=0;
        else if(En)
            {WB_Wreg, WB_Reg2reg, WB_ALU_R, WB_DMO, WB_RT_RD_Addr}<=
            {MEM_Wreg,MEM_Reg2reg,MEM_ALU_R,MEM_DMO,MEM_RT_RD_Addr};
    end
    
endmodule
