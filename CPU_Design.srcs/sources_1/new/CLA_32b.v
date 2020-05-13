`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2020 01:51:46 PM
// Design Name: 
// Module Name: CLA_32b
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

module CLA_4(X,Y,Cin,S,Cout);
    
    input   [3:0]   X,Y;
    input           Cin;
    
    output          Cout;
    output  [3:0]   S;
    
    and i0(Y_3,X[3],Y[3]);
    or i1(X_3,X[3],Y[3]);
    and i2(Y_2,X[2],Y[2]);
    or i3(X_2,X[2],Y[2]);
    and i4(Y_1,X[1],Y[1]);
    or i5(X_1,X[1],Y[1]);
    and i6(Y_0,X[0],Y[0]);
    or i7(X_0,X[0],Y[0]);
    not i01(Y_31,Y_3);
    nand i02(Y_32,X_3,Y_2);
    nand i03(Y_33,X_3,X_2,Y_1);
    nand i04(Y_34,X_3,X_2,X_1,Y_0);
    nand i05(Y_35,X_3,X_2,X_1,X_0,Cin);
    nand i00(Cout,Y_31,Y_32,Y_33,Y_34,Y_35);
    not i_2(Y__3,Y_3);
    and i21(Y_21,Y__3,X_3);
    not i22(Y_22,Y_2);
    nand i23(Y_23,X_2,Y_1);
    nand i24(Y_24,X_2,X_1,Y_0);
    nand i25(Y_25,X_2,X_1,X_0,Cin);
    nand i26(Y_26,Y_22,Y_23,Y_24,Y_25);
    xor i20(S[3],Y_21,Y_26);
    not i_1(Y__2,Y_2);
    and i11(Y_11,Y__2,X_2);
    not i12(Y_12,Y_1);
    nand i13(Y_13,X_1,Y_0);
    nand i14(Y_14,X_1,X_0,Cin);
    nand i15(Y_15,Y_12,Y_13,Y_14);
    xor i10(S[2],Y_11,Y_15);
    not i_0(Y__1,Y_1);
    and i51(Y_51,Y__1,X_1);
    not i52(Y_52,Y_0);
    nand i53(Y_53,X_0,Cin);
    nand i54(Y_54,Y_52,Y_53);
    xor i50(S[1],Y_51,Y_54);
    not i41(Y__0,Y_0);
    and i42(Y_4,Y__0,X_0);
    xor i40(S[0],Y_4,Cin);
endmodule


module CLA_32b(X,Y,Cin,S,Cout);
    
    input[31:0]X,Y;
    input Cin;
    
    output[31:0]S;
    output Cout;
    
    wire [6:0]C;
    
    CLA_4 add0(
        .X(X[3:0]),
        .Y(Y[3:0]),
        .Cin(Cin),
        .S(S[3:0]),
        .Cout(C[0])
    );
    
    CLA_4 add1(
        .X(X[7:4]),
        .Y(Y[7:4]),
        .Cin(C[0]),
        .S(S[7:4]),
        .Cout(C[1])
    );
    
    CLA_4 add2(
        .X(X[11:8]),
        .Y(Y[11:8]),
        .Cin(C[1]),
        .S(S[11:8]),
        .Cout(C[2])
    );
    
    CLA_4 add3(
        .X(X[15:12]),
        .Y(Y[15:12]),
        .Cin(C[2]),
        .S(S[15:12]),
        .Cout(C[3])
    );
    
    CLA_4 add4(
        .X(X[19:16]),
        .Y(Y[19:16]),
        .Cin(C[3]),
        .S(S[19:16]),
        .Cout(C[4])
    );
    
    CLA_4 add5(
        .X(X[23:20]),
        .Y(Y[23:20]),
        .Cin(C[4]),
        .S(S[23:20]),
        .Cout(C[5])
    );
    
    CLA_4 add6(
        .X(X[27:24]),
        .Y(Y[27:24]),
        .Cin(C[5]),
        .S(S[27:24]),
        .Cout(C[6])
    );
    
    CLA_4 add7(
        .X(X[31:28]),
        .Y(Y[31:28]),
        .Cin(C[6]),
        .S(S[31:28]),
        .Cout(Cout)
    );
    
endmodule

