`timescale 1ns / 1ps

module twobitadder(
    input [1:0] A,
    input [1:0] B,
    input Cin,
    output [1:0] S,
    output Cout,
    output C2
    );
    
    wire C1;
    assign C2 = C1;
    fullbit fa0 ( A[0] , B[0] , Cin , S[0] , C1 );
    fullbit fa1 ( A[1] , B[1] , C1 , S[1] , Cout);
    
endmodule
