`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 10:50:55 AM
// Design Name: 
// Module Name: IM
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


module IM(Addr, Inst, Clk );
    
    input       [31:0]  Addr;
    input               Clk;
    
    output  reg [31:0]  Inst;
    
    reg         [31:0]  ROM [1023:0];
    
    initial
    begin
        
    end
    
    always @(posedge Clk)
    begin
        Inst<=ROM[Addr[11:2]];
    end
    
endmodule
