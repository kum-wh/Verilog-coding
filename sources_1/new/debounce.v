`timescale 1ns / 1ps

module debounce(input ck, btn, output out );
wire A;
wire C1; wire C2;
clock ck1(ck, A);
dff fa0(A, btn, C1);
dff fa1(A, C1, C2);
assign out = (C1) & (~C2);

endmodule
