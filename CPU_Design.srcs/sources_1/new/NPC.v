`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 09:18:16 AM
// Design Name: 
// Module Name: NPC
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


module NPC(PC, NPCOp, IMM, NPC );      
    
    input  [31:0] PC;   
    input  [1:0]  NPCOp; // PLUS4(2'b00), BRANCH(2'b01), JUMP(2'b10)  
    input  [25:0] IMM; 
    
    output reg [31:0] NPC;
    
    
    
endmodule
