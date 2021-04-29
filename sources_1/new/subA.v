`timescale 1ns / 1ps

module subA(input CLOCK, btnC, [3:0]sw, output [15:0]led, [6:0]seg, [3:0]an, trigger);
   
    wire C;
    assign trigger = sw[0] & sw[1] & sw[2] & sw[3];
    fingerprint fa0(CLOCK, btnC, C, led);
    sevenseg3 fa1(CLOCK, C, sw, an, seg);

endmodule
