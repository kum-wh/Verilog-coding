`timescale 1ns / 1ps

module assignment2(

    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output SEG0,
    output SEG1,
    output SEG2,
    output SEG3,
    output SEG4,
    output SEG5,
    output SEG6,
    output DP,

    input [6:0] A,
    input [6:0] B,
    output [6:0] S,
    output Cout
    );
    
    wire C1;
    wire C2;
    wire C3;
    wire C4;
    wire C5;
    wire C6;
    wire [6:0] T;
    
    assign Cout =(C4^C6) | C5;
    assign C5 = (T[6:0] == 7'b1000000) ? 1 : 0 ;   
    fivebitadder fa0 ( 5'b00001, ~B [4:0] , T[4:0] , C1 );
    twobitadderr fa1 ( 2'b00 , ~B [6:5] , C1, T[6:5]);    
    fivebitadder fa2 ( A[4:0] , T [4:0] , S[4:0] , C2 );
    twobitadder fa3 ( A[6:5] , T [6:5] , C2, S[6:5], C4, C6);
   
    assign AN2 = 0;
    assign AN1 = 0;
    assign SEG3 = 0;
    assign SEG4 = 0;
    assign SEG5 = 0;

        
endmodule
