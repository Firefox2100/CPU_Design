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
        ROM[0]=32'h341d000c;
        ROM[1]=32'h34021234;
        ROM[2]=32'h34033456;
        ROM[3]=32'h00432021;
        ROM[4]=32'h00643023;
        ROM[5]=32'hac020000;
        ROM[6]=32'hac030004;
        ROM[7]=32'hafa40004;
        ROM[8]=32'h8c050000;
        ROM[9]=32'h10450001;
        ROM[10]=32'h8fa30004;
        ROM[11]=32'h8c050004;
        ROM[12]=32'h1065fffd;
        ROM[13]=32'h0c000c0e;
        ROM[14]=32'h00c23023;
        ROM[15]=32'hafa6fffc;
        ROM[16]=32'h1064ffff;
    end
    
    always @(posedge Clk)
    begin
        #1 Inst<=ROM[Addr[11:2]];
    end
    
endmodule
