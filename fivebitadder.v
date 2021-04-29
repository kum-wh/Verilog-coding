`timescale 1ns / 1ps

module fivebitadder(
    input [4:0] A,
    input [4:0] B,
    output [4:0] S,
    output C5
    );
    
    wire C1;
    wire C2;
    wire C3;
    wire C4;
    
    halfadder fa0 ( A[0] , B[0] , S[0] , C1 );
    fullbit fa1 ( A[1] , B[1] , C1 , S[1] , C2);
    fullbit fa2 ( A[2] , B[2] , C2 , S[2] , C3);
    fullbit fa3 ( A[3] , B[3] , C3 , S[3] , C4);
    fullbit fa4 ( A[4] , B[4] , C4 , S[4] , C5);
endmodule
