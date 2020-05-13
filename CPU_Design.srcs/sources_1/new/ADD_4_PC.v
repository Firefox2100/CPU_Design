`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2020 10:39:33 AM
// Design Name: 
// Module Name: ADD_4_PC
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


module ADD_4_PC(in, out );
    
    input   [31:0]  in;
    
    output  [31:0]  out;
    
    CLA_32b CLA(
        .X(in),
        .Y({32'b00000000000000000000000000000100}),
        .S(out),
        .Cin(1'b0),
        .Cout()
    );
    
endmodule
