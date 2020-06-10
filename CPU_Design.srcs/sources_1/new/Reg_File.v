`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2020 08:46:38 AM
// Design Name: 
// Module Name: Reg_File
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


module Reg_File(A1, A2, A3, WD, clk, RFWr, clr, RD1, RD2 );
    
    input  [4:0]  A1, A2, A3;               //Addresses, A1 and A2 for read, A3 for write
    input  [31:0] WD;                       //Data to be written in
    input         clk;                      //Clock signal
    input         RFWr;                     //Register write enable
    input         clr;                      //Register clear
    
    output [31:0] RD1, RD2;                 //Data output of A1 and A2
    
    reg [31:0]REGS[0:31];                   //Registers
    integer temp;                           //Temporary variable for loops
    
    assign RD1=REGS[A1];                    //Read the data asynchronously
    assign RD2=REGS[A2];
    
    initial
    begin
        for(temp=0;temp<31;temp=temp+1)
            REGS[temp]<=0;                  //Set all to 0
    end
    
    always @ (posedge clk or posedge clr)
    begin
        if(!clr)                             //Clear signal active
            for(temp=0;temp<32;temp=temp+1)
                REGS[temp]<=0;
        else                                //Clock signal active
            if(RFWr)
                REGS[A3]<=WD;               //Wite the data synchronously
    end
    
endmodule
