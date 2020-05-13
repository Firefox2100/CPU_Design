`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2020 09:58:38 AM
// Design Name: 
// Module Name: PC
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


module PC(NPC, clk, PCWr, Clrn, PC, stall );
    
    input       [31:0]  NPC;
    input               clk;
    input               PCWr;
    input               Clrn;
    input               stall;
    
    output reg  [31:0]  PC;
    
    wire SAFE;
    
    assign SAFE=PCWr&~stall;
    
    always @ (posedge clk)
    begin
        if(!Clrn)
            PC <= 0;
        else if(SAFE)
            PC <= NPC;
    end

endmodule 
