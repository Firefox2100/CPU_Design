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
    wire    [31:0]  EX_RD1;     //Data read from register file on address 1, cached by IDEX
    wire    [31:0]  ID_RD2;     //Data read from register file on address 2
    wire    [31:0]  EX_RD2;     //Data read from register file on address 2, cached by IDEX
    wire    [31:0]  MEM_RD2;    //Data read from register file on address 2, cached by EXMEM
    wire    [31:0]  Extended;   //Address that has been extended to 32 bit
    wire    [31:0]  EX_Extended;//Address that has been extended to 32 bit, cached by IDEX
    wire    [31:0]  Branch_Addr;//Relative address of the branch jump
    wire    [31:0]  BA;         //Address from b instruction
    wire    [31:0]  EX_BA;      //Address from b instruction cached by IDEX
    wire    [31:0]  J_addr;     //Address combined for j instruction
    wire    [31:0]  EX_J_addr;  //Address combined for j instruction cached by IDEX
    wire    [31:0]  ALU_Y;      //Data goes into Y of ALU
    wire    [31:0]  Fwd_X;      //Data that is forwarded into X of ALU
    wire    [31:0]  Fwd_Y;      //Data that is forwarded into Y of ALU
    wire    [31:0]  ALU_R;      //The result of ALU
    wire    [31:0]  MEM_ALU_R;  //The result of ALU, cached by EXMEM
    wire    [31:0]  WB_ALU_R;   //The result of ALU, cached by MEMWB
    wire    [31:0]  DMO;        //Data memory output
    wire    [31:0]  WB_DMO;     //Data memory output, cached by MEMWB
    wire    [31:0]  WB_Data;    //Data to be written back into the register file
    wire    [5:0]   E_Op;       //OP of EX stage
    wire    [5:0]   E_Func;     //func of EX stage
    wire    [4:0]   RT_RD_Addr; //Target address taken from RT/RD
    wire    [4:0]   E_Rd;       //Target address taken from RT/RD, cached by IDEX
    wire    [4:0]   M_Rd;       //Target address taken from RT/RD, cached by EXMEM
    wire    [4:0]   W_Rd;       //Target address taken from RT/RD, cached by MEMWB
    wire    [1:0]   Aluc;       //Signal to control ALU to work in different modes
    wire    [1:0]   EX_Aluc;    //Signal to control ALU to work in different modes, cached by IDEX
    wire    [1:0]   Se;         //Signal to control extending
    wire    [1:0]   FwdA;       //Signal to control forward
    wire    [1:0]   EX_FwdA;    //Signal to control forward, cached by IDEX
    wire    [1:0]   FwdB;       //Signal to control forward
    wire    [1:0]   EX_FwdB;    //Signal to control forward, cached by IDEX
    wire    [1:0]   Pcsrc;      //Signal to control the source of new PC address.
    wire            NCLK;       //Negative clock to drive the register file
    wire            stall;      //Signal to shut down PC for a clock cycle
    wire            condep;     //Signal to clear some cache to insert bubble
    wire            Regrt;      //Signal representing whether it is a I instruction or R
    wire            Wreg;       //Signal to indicate whether it is required to write to register files
    wire            E_Wreg;     //Signal to indicate whether it is required to write to register files, cached by IDEX
    wire            M_Wreg;     //Signal to indicate whether it is required to write to register files, cached by EXMEM
    wire            W_Wreg;     //Signal to indicate whether it is required to write to register files, cached by MEMWB
    wire            Wmem;
    wire            EX_Wmem;
    wire            MEM_Wmem;
    wire            Reg2reg;
    wire            E_Reg2reg;
    wire            M_Reg2reg;
    wire            W_Reg2reg;
    wire            Aluqb;      //Signal to control the input on Y of ALU, depending on whether push forward
    wire            EX_Aluqb;   //Signal to control the input on Y of ALU, depending on whether push forward, cached by IDEX
    wire            Zero;       //Signal from ALU indicating whether the two operate numbers are the same
    
    assign NCLK=!CLK;
    
    ADD_4_PC ADD_4_PC(
        .in(IF_Addr),
        .out(IF_ADD4)
    );
    
    Reg_File Reg_File(
        .A1(ID_Inst[25:21]),
        .A2(ID_Inst[20:16]),
        .A3(W_Rd),
        .WD(WB_Data),
        .clk(NCLK),
        .RFWr(W_Wreg),
        .clr(CLRN),
        .RD1(ID_RD1),
        .RD2(ID_RD2)
    );
    
    Comb J_Comb(
        .X(ID_Inst[25:0]),
        .PCADD4(ID_ADD4),
        .J_addr(J_addr)
    );
    
    MUX_32b_3 Addr_MUX(
        .A0(IF_ADD4),
        .A1(EX_BA),
        .A2(EX_J_addr),
        .S(Pcsrc),
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
        .A(Fwd_X),
        .B(ALU_Y),
        .ALUOp(EX_Aluc),
        .C(ALU_R),
        .Zero(Zero)
    );
    
    EXT EXT(
        .Imm16(ID_Inst[15:0]),
        .EXTOp(Se),
        .Imm32(Extended)
    );
    
    CONTROL CONTROL(
        .E_Op(E_Op),
        .Op(ID_Inst[31:26]),
        .E_Func(E_Func),
        .Func(ID_Inst[5:0]),
        .Zero(Zero),
        .Regrt(Regrt),
        .Se(Se),
        .Wreg(Wreg),
        .Aluqb(Aluqb),
        .Aluc(Aluc),
        .Wmem(Wmem),
        .Pcsrc(Pcsrc),
        .Reg2reg(Reg2reg),
        .Rs(ID_Inst[25:21]),
        .Rt(ID_Inst[20:16]),
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
        .Inst(IF_Inst),
        .Clk(CLK)
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
        .S(Regrt)
    );
    
    IDEX IDEX(
        .clk(CLK),
        .EN(EN),
        .clrm(CLRN),
        .condep(condep),
        .stall(stall),
        .ID_RD1(ID_RD1),
        .ID_RD2(ID_RD2),
        .ID_Extended(Extended),
        .ID_BA(BA),
        .ID_J_addr(J_addr),
        .ID_OP(ID_Inst[31:26]),
        .ID_func(ID_Inst[5:0]),
        .ID_RT_RD_Addr(RT_RD_Addr),
        .ID_Aluc(Aluc),
        .ID_FwdA(FwdA),
        .ID_FwdB(FwdB),
        .ID_Aluqb(Aluqb),
        .ID_Wreg(Wreg),
        .ID_Wmem(Wmem),
        .ID_Reg2reg(Reg2reg),
        .EX_RD1(EX_RD1),
        .EX_RD2(EX_RD2),
        .EX_Extended(EX_Extended),
        .EX_BA(EX_BA),
        .EX_J_addr(EX_J_addr),
        .EX_OP(E_Op),
        .EX_func(E_Func),
        .EX_RT_RD_Addr(E_Rd),
        .EX_Aluc(EX_Aluc),
        .EX_FwdA(EX_FwdA),
        .EX_FwdB(EX_FwdB),
        .EX_Aluqb(EX_Aluqb),
        .EX_Wreg(E_Wreg),
        .EX_Wmem(EX_Wmem),
        .EX_Reg2reg(E_Reg2reg)
    );
    
    MUX_32b_2 ALU_Y_MUX(
        .A0(EX_Extended),
        .A1(Fwd_Y),
        .S(EX_Aluqb),
        .Y(ALU_Y)
    );
    
    EXMEM EXMEM(
        .En(EN),
        .Clk(CLK),
        .Clrn(CLRN),
        .EX_ALU_R(ALU_R),
        .EX_RD2(EX_RD2),
        .EX_RT_RD_Addr(E_Rd),
        .EX_Wreg(E_Wreg),
        .EX_Reg2reg(E_Reg2reg),
        .EX_Wmem(EX_Wmem),
        .MEM_ALU_R(MEM_ALU_R),
        .MEM_RD2(MEM_RD2),
        .MEM_RT_RD_Addr(M_Rd),
        .MEM_Wreg(M_Wreg),
        .MEM_Reg2reg(M_Reg2reg),
        .MEM_Wmem(MEM_Wmem)
    );
    
    DM DM(
        .Addr(MEM_ALU_R),
        .Din(MEM_RD2),
        .Clk(CLK),
        .We(MEM_Wmem),
        .Dout(DMO)
    );
    
    MUX_32b_3 ALU_X_Fwd(
        .A0(EX_RD1),
        .A1(WB_Data),
        .A2(MEM_ALU_R),
        .S(EX_FwdA),
        .Y(Fwd_X)
    );
    
    MUX_32b_3 ALU_Y_Fwd(
        .A0(EX_RD2),
        .A1(WB_Data),
        .A2(MEM_ALU_R),
        .S(EX_FwdB),
        .Y(Fwd_Y)
    );
    
    MEMWB MEMWB(
        .En(EN),
        .Clk(CLK),
        .Clrn(CLRN),
        .MEM_ALU_R(MEM_ALU_R),
        .MEM_DMO(DMO),
        .MEM_Wreg(M_Wreg),
        .MEM_Reg2reg(M_Reg2reg),
        .MEM_RT_RD_Addr(M_Rd),
        .WB_ALU_R(WB_ALU_R),
        .WB_DMO(WB_DMO),
        .WB_Wreg(W_Wreg),
        .WB_Reg2reg(W_Reg2reg),
        .WB_RT_RD_Addr(W_Rd)
    );
    
    MUX_32b_2 WB_MUX(
        .A0(WB_DMO),
        .A1(WB_ALU_R),
        .S(W_Reg2reg),
        .Y(WB_Data)
    );
    
endmodule
