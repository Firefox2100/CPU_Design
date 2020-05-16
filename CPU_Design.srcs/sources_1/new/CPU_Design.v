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
// Implemented instructions:
// name         op              shamt           func
// add          000000          000000          100000
// sub          000000          000000          100010
// ori          001101
// lw           100011
// sw           101011
// beq          000100
// j            000010
//////////////////////////////////////////////////////////////////////////////////


module CPU_Design(CLK, EN, CLRN );
    
    input CLK,EN,CLRN;
    
    wire    [31:0]  NPC;        //Address to update PC
    wire    [31:0]  IF_Addr;    //PC current address
    wire    [31:0]  IF_ADD4;    //PC added 4
    wire    [31:0]  ID_ADD4;    //PC added 4 from IFID
    wire    [31:0]  IF_Inst;    //Instruction from IM
    wire    [31:0]  ID_Inst;    //Instruction cached by IFID
    wire    [31:0]  ID_RD1;     //Data read from register file on address 1
    wire    [31:0]  ID_RD2;     //Data read from register file on address 2
    wire    [31:0]  Extended;   //Address that has been extended to 32 bit
    wire    [31:0]  Branch_Addr;//Relative address of the branch jump
    wire    [31:0]  BA;         //Address from b instruction
    wire    [4:0]   RT_RD_Addr; //Target address taken from RT/RD
    wire    [1:0]   Se;         //Signal to control extending
    wire            stall;      //Signal to shut down PC for a clock cycle
    wire            condep;     //Signal to clear some cache to insert bubble
    
    
    
    ADD_4_PC ADD_4_PC(
        .in(IF_Addr),
        .out(IF_ADD4)
    );
    
    Reg_File Reg_File(
        .A1(ID_Inst[25:21]),
        .A2(ID_Inst[20:16]),
        .A3(),
        .WD(),
        .clk(CLK),
        .RFWr(),
        .clr(CLRN),
        .RD1(ID_RD1),
        .RD2(ID_RD2)
    );
    
    MUX_32b_3 Addr_MUX(
        .A0(IF_ADD4),
        .A1(BA),
        .A2(),
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
    
    EXT EXT(
        .Imm16(ID_Inst[15:0]),
        .EXTOp(Se),
        .Imm32(Extended)
    );
    
    CONTROL CONTROL(
        .E_Op(),
        .Op(ID_Inst[31:26]),
        .E_Func(),
        .Func(ID_Inst[5:0]),
        .Zero(),
        .Regrt(),
        .Se(Se),
        .Wreg(),
        .Aluqb(),
        .Aluc(),
        .Wmem(),
        .Pcsrc(),
        .Reg2reg(),
        .shift(),
        .j(),
        .Rs(ID_Inst[25:21]),
        .Rt(ID_Inst[20:16]),
        .E_Rd(),
        .M_Rd(),
        .E_Wreg(),
        .M_Wreg(),
        .FwdA(),
        .FwdB(),
        .E_Reg2reg(),
        .stall(stall),
        .condep(condep)
    );
    
    IFID IFID(
        .IF_ADD4(IF_ADD4),
        .IF_Inst(IF_Inst),
        .En(EN),
        .Clk(CLK),
        .Clrn(CLRN),
        .ID_ADD4(ID_ADD4),
        .ID_Inst(ID_Inst),
        .stall(stall),
        .condep(condep)
    );
    
    IM IM(
        .Addr(IF_Addr),
        .Inst(IF_Inst)
    );
    
    CLA_32b Branch_Calc(
        .X(ID_ADD4),
        .Y(Branch_Addr),
        .S(BA),
        .Cin(0),
        .Cout()
    );
    
    BS Branch_Shifter(
        .Extended(Extended),
        .Branch_Addr(Branch_Addr)
    );
    
    MUX_5bit_2 MUX_rt_rd(
        .A0(ID_Inst[15:11]),
        .A1(ID_Inst[20:16]),
        .Y(RT_RD_Addr),
        .S()
    );
    
    IDEX IDEX(
        .clk(CLK),
        .EN(EN),
        .clrm(CLRN),
        .condep(condep),
        .stall(stall),
        .ID_RD1(ID_RD1),
        .ID_RD2(ID_RD2),
        .EX_RD1(),
        .EX_RD2()
    );
    
endmodule
