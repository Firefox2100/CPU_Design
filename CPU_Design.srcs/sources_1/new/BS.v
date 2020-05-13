`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2020 03:56:42 PM
// Design Name: 
// Module Name: BS
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


module BS(Extended, Branch_Addr );
    
    input   [31:0]  Extended;
    output  [31:0]  Branch_Addr;
    
    assign Branch_Addr={Extended[29:0],2'b00};
    
endmodule
