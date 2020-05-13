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


module IM(Addr, Inst );
    
    input   [31:0]  Addr;
    
    output  [31:0]  Inst;
    
    wire[31:0]Rom[31:0];
    
    assign Rom[5'h00]=32'h00000000;
    assign Rom[5'h01]=32'h00000000;
    assign Rom[5'h02]=32'h00000000;
    assign Rom[5'h03]=32'h00000000;
    assign Rom[5'h04]=32'h00000000;
    assign Rom[5'h05]=32'h00000000;
    assign Rom[5'h06]=32'h00000000;
    assign Rom[5'h07]=32'h00000000;
    assign Rom[5'h08]=32'h00000000;
    assign Rom[5'h09]=32'h00000000;
    assign Rom[5'h0A]=32'h00000000;
    assign Rom[5'h0B]=32'h00000000;
    assign Rom[5'h0C]=32'h00000000;
    assign Rom[5'h0D]=32'h00000000;
    assign Rom[5'h0E]=32'h00000000;
    assign Rom[5'h0F]=32'h00000000;
    assign Rom[5'h10]=32'h00000000;
    assign Rom[5'h11]=32'h00000000;
    assign Rom[5'h12]=32'h00000000;
    assign Rom[5'h13]=32'h00000000;
    assign Rom[5'h14]=32'h00000000;
    assign Rom[5'h15]=32'h00000000;
    assign Rom[5'h16]=32'h00000000;
    assign Rom[5'h17]=32'h00000000;
    assign Rom[5'h18]=32'h00000000;
    assign Rom[5'h19]=32'h00000000;
    assign Rom[5'h1A]=32'h00000000;
    assign Rom[5'h1B]=32'h00000000;
    assign Rom[5'h1C]=32'h00000000;
    assign Rom[5'h1D]=32'h00000000;
    assign Rom[5'h1E]=32'h00000000;
    assign Rom[5'h1F]=32'h00000000;
    assign Inst=Rom[Addr[6:2]];
endmodule
