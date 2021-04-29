`timescale 1ns / 1ps

module soundbar24(input clock, [1:0] R, [15:0] tester, [12:0] index, output reg [15:0] data );
    wire [15:0] A; wire [15:0] B; wire [15:0] C; wire [15:0] D; wire [15:0] E;
    colourselecter fa0(clock, R, A, B, C, D, E);
 always @ (posedge clock) begin
    data<=(index <= 13'b0000001011111)?B:(index >= 13'b1011110100000)?B:(index % 96 == 0)?B:(index % 96 == 95)?B:A;
 end
endmodule
