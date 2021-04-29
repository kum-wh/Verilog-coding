`timescale 1ns / 1ps

module fullbit(
    input A,
    input B,
    input Cin,
    output S,
    output Cout
    );
    
    assign S = A^B^Cin;
    assign Cout = (A & B) | ( Cin & ( A ^ B ) );
    
endmodule
