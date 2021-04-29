`timescale 1ns / 1ps

module fullbitt(
    input A,
    input B,
    input Cin,
    output S
);

assign S = A^B^Cin;
endmodule
