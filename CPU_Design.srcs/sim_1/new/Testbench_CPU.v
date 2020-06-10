`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2020 08:58:48 AM
// Design Name: 
// Module Name: Testbench_CPU
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


module Testbench_CPU();
    
    reg         CLK,EN,CLRN;
    
    initial begin 
        CLK=0;
        CLRN=0;
        EN=1;
        #10
        CLRN<=1;
    end
    
    always #5 CLK=~CLK;
    
    CPU_Design CPU(
        .CLK(CLK),
        .EN(EN),
        .CLRN(CLRN)
    );
    
endmodule
