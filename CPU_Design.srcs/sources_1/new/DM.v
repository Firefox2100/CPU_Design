`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 07:29:26 PM
// Design Name: 
// Module Name: DM
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


module DM(Addr, Din, Clk, We, Dout );
    
    input [31:0]Addr,Din;
    input Clk,We;
    
    output [31:0]Dout;
    
    reg [31:0] RAM [1023:0];
    
    always @ (posedge Clk)
    begin
        if (We) RAM[Addr[11:2]] <= Din;
	end
	
    assign Dout = RAM[Addr[11:2]];
    
endmodule
