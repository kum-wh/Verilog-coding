`timescale 1ns / 1ps

module assignment4(input CLOCK, btnL, btnC, btnR, btnU, [3:0]sw, output [15:0]led, [6:0]seg, [3:0]an );
wire C;
wire [6:0] seg1;
wire [3:0] an1;
wire [6:0] seg2;
wire [3:0] an2;
assign seg = (C==1)?seg2:seg1;
assign an = (C==1)?an2:an1;
subA sub1(CLOCK, btnC, sw, led, seg1, an1, C);
subB sub2(C, CLOCK, btnL, btnC, btnR, btnU, seg2, an2);

endmodule
