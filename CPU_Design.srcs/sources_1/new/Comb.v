`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 09:43:15 PM
// Design Name: 
// Module Name: Comb
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


module Comb(X,PCADD4,J_addr);
    
    input   [25:0]  X;
    input   [31:0]  PCADD4;
    
    output  [31:0]  J_addr;
    
    assign J_addr={PCADD4[31:28],X[25:0],2'b00};
    
endmodule
