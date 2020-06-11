`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2020 09:07:05 AM
// Design Name: 
// Module Name: Testbench_CONTROL
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


module Testbench_CONTROL();
    
    reg       [5:0]   Op;
    reg       [5:0]   Func;
    reg       [5:0]   E_Op;
    reg       [5:0]   E_Func;
    reg               Zero;
    reg               E_Wreg;
    reg               M_Wreg;
    reg               E_Reg2reg;
    reg       [4:0]   E_Rd;
    reg       [4:0]   M_Rd;
    reg       [4:0]   Rs;
    reg       [4:0]   Rt;
    wire              Regrt;
    wire      [1:0]   Se;
    wire              Wreg,Aluqb,Wmem,Reg2reg,stall,condep;
    wire      [1:0]   Pcsrc;
    wire      [1:0]   Aluc;
    wire      [1:0]   FwdA,FwdB;
    
    initial
    begin
        {Op,Func,E_Op,E_Func,Zero,E_Wreg,M_Wreg,E_Reg2reg,E_Rd,M_Rd,Rs,Rt}=
        {0};
    end
    
    CONTROL Control(
        .E_Op(E_Op),
        .Op(Op),
        .E_Func(E_Func),
        .Func(Func),
        .Zero(Zero),
        .Regrt(Regrt),
        .Se(Se),
        .Wreg(Wreg),
        .Aluqb(Aluqb),
        .Aluc(Aluc),
        .Wmem(Wmem),
        .Pcsrc(Pcsrc),
        .Reg2reg(Reg2reg),
        .Rs(Rs),
        .Rt(Rt),
        .E_Rd(E_Rd),
        .M_Rd(M_Rd),
        .E_Wreg(E_Wreg),
        .M_Wreg(M_Wreg),
        .FwdA(FwdA),
        .FwdB(FwdB),
        .E_Reg2reg(E_Reg2reg),
        .stall(stall),
        .condep(condep)
    );
    
endmodule
