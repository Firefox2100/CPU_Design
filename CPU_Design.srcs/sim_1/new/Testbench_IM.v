`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2020 09:06:21 AM
// Design Name: 
// Module Name: Testbench_IM
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


module Testbench_IM();
    
    reg     [31:0]  Addr;
    reg             Clk;
    wire    [31:0]  Inst;
    
    initial
    begin
        Clk=0;
        forever #10 Clk=~Clk;
    end
    
    initial
    begin
        #10 Addr=0;
        forever #20 Addr=Addr+4;
    end
    
    IM IM(
        .Addr(Addr),
        .Inst(Inst),
        .Clk(Clk)
    );
    
    
endmodule
