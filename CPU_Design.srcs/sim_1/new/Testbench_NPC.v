`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2020 06:41:18 PM
// Design Name: 
// Module Name: Testbench_NPC
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


module Testbench_NPC();
    
    reg     [31:0]  PC;
    reg     [1:0]   NPCOp; // PLUS4(2'b00), BRANCH(2'b01), JUMP(2'b10)
    reg     [25:0]  IMM;
    
    wire    [31:0]  NPC;
    
    NPC NPC_M(
        .PC(PC),
        .NPCOp(NPCOp),
        .IMM(IMM),
        .NPC(NPC)
    );
    
    initial
    begin
        PC=32'b000000001010011010110110011010;
        IMM=26'b01001001011101001011010110;
        NPCOp=0;
        #20 NPCOp=1;
        #20 NPCOp=2;
    end
    
endmodule
