`timescale 1ns / 1ps

module twobitadderr(
    input [1:0] A,
    input [1:0] B,
    input Cin,
    output [1:0] S
   );
   
   wire C1;
   
   fullbit fa0 ( A[0] , B[0] , Cin , S[0] , C1 );
   fullbitt fa1 ( A[1] , B[1] , C1 , S[1]);
   
endmodule
