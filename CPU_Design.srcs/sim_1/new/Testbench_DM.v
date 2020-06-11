`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2020 09:06:44 AM
// Design Name: 
// Module Name: Testbench_DM
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


module Testbench_DM();
    
    reg [31:0] Addr,Din;
    reg Clk,We;
    
    wire [31:0] Dout;
    
    initial
    begin
        Addr=0;
        Din=45;
        We=0;
        #10 We=1;
        #20 Addr=15;
        Din=76;
        #20 We=0;
        Addr=0;
    end
    
    initial
    begin
        Clk=0;
        forever #10 Clk=~Clk;
    end
    
    DM DM(
        .Addr(Addr),
        .Din(Din),
        .Clk(Clk),
        .We(We),
        .Dout(Dout)
    );
    
endmodule
