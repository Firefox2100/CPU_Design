`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 10:37:35 AM
// Design Name: 
// Module Name: CONTROL
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


module CONTROL(E_Op,Op,E_Func,Func,Zero,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,shift,j,Rs,Rt,E_Rd,M_Rd,E_Wreg,M_Wreg,FwdA,FwdB,E_Reg2reg,stall,condep);
    
    input       [5:0]   Op;                                         //op from the id stage
    input       [5:0]   Func;                                       //func from the id stage
    input       [5:0]   E_Op;                                       //op from the ex stage
    input       [5:0]   E_Func;                                     //func from the ex stage
    input               Zero;                                       //Zero from ALU
    input               E_Wreg;
    input               M_Wreg;
    input               E_Reg2reg;
    input       [4:0]   E_Rd;
    input       [4:0]   M_Rd;
    input       [4:0]   Rs;
    input       [4:0]   Rt;
    output              Regrt;
    output      [1:0]   Se;                                         //Signal to control extending
    output              Wreg,Aluqb,Wmem,Reg2reg,stall,condep;
    output      [1:0]   Pcsrc;
    output      [1:0]   Aluc;
    output              shift;
    output              j;
    output  reg [1:0]   FwdA,FwdB;
    
    wire i_add  =   (Op == 6'b000000 & Func == 6'b100000)?1:0;      //add
    wire i_sub  =   (Op == 6'b000000 & Func == 6'b100010)?1:0;      //sub
    wire i_ori  =   (Op == 6'b001101)?1:0;                          //ori
    wire i_lw   =   (Op == 6'b100011)?1:0;                          //lw
    wire i_sw   =   (Op == 6'b101011)?1:0;                          //sw
    wire i_beq  =   (Op == 6'b000100)?1:0;                          //beq
    wire i_j    =   (Op == 6'b000010)?1:0;                          //j
    wire E_beq  =   (E_Op == 6'b000100)?1:0;                        //beq
    wire E_j    =   (E_Op == 6'b000010)?1:0;                        //j
    wire E_Inst =   i_add|i_sub|i_sw|i_beq;
    
    assign  Wreg        = i_add|i_sub|i_ori|i_lw;
    assign  Regrt       = i_ori|i_lw |i_sw |i_beq|i_j;
    assign  Reg2reg     = i_add|i_sub|i_ori|i_sw |i_beq|i_j;
    assign  Aluqb       = i_add|i_sub|i_beq|i_j;
    assign  Se[0]       = i_lw |i_sw |i_beq;
    assign  Se[1]       = 0;
    assign  Aluc[1]     = i_ori;
    assign  Aluc[0]     = i_sub;
    assign  Wmem        = i_sw;
    assign  Pcsrc[0]    = E_beq&Zero;
    assign  Pcsrc[1]    = E_j;
    //assign shift = i_sll | i_srl | i_sra;
    //assign j = i_jal | i_jr;
    always@(E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt,i_add,i_sub,i_sw,i_beq)
    begin
        FwdA=2'b00;
        if((Rs==E_Rd)&(E_Rd!=0)&(E_Wreg==1))begin
            FwdA=2'b10;
        end else begin
            if((Rs==M_Rd)&(M_Rd!=0)&(M_Wreg==1))begin
                FwdA=2'b01;
            end
        end
    end
    always@(E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt,i_add,i_sub,i_sw,i_beq)
    begin
        FwdB=2'b00;
        if((Rt==E_Rd)&((i_add==1)|(i_sub==1)|(i_sw==1)|(i_beq==1))&(E_Rd!=0)&(E_Wreg==1))
        begin
            FwdB=2'b10;
        end 
        else
        begin
            if((Rt==M_Rd)&((i_add==1)|(i_sub==1)|(i_sw==1)|(i_beq==1))&(M_Rd!=0)&(M_Wreg==1))
            begin
                FwdB=2'b01;
            end
        end
    end
    assign stall=((Rs==E_Rd)|(Rt==E_Rd))&(E_Reg2reg==0)&(E_Rd!=0)&(E_Wreg==1);
    assign condep=E_beq&Zero;
endmodule
