`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 09:04:54 AM
// Design Name: 
// Module Name: CPU_Design
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


module CPU_Design(CLK, EN, CLRN );
    
    input CLK,EN,CLRN;
    
    wire    [31:0]  NPC;        //Address to update PC
    wire    [31:0]  IF_Addr;    //PC current address
    wire    [31:0]  IF_ADD4;    //PC added 4
    wire            stall;      //Signal to shut down PC for a clock cycle
    
    
    
    ADD_4_PC ADD_4_PC(
        .in(IF_Addr),
        .out(IF_ADD4)
    );
    
    Reg_File Reg_File(
        .A1(),
        .A2(),
        .A3(),
        .WD(),
        .clk(),
        .RFWr(),
        .clr(),
        .RD1(),
        .RD2()
    );
    
    MUX_32b_4 MUX_32b_4(
        .A0(IF_ADD4),
        .A1(),
        .A2(),
        .A3(),
        .S(),
        .Y(NPC)
    );
    
    PC PC(
        .NPC(NPC),
        .clk(CLK),
        .PCWr(EN),
        .Clrn(CLRN),
        .PC(IF_Addr),
        .stall(stall) 
    );
    
    ALU ALU(
        .A(),
        .B(),
        .ALUOp(),
        .C(),
        .Zero()
    );
    
endmodule
