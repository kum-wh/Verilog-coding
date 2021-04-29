`timescale 1ns / 1ps

module event2(input CLOCK, input full, output [7:0]seg);
    wire C1;
    watch(CLOCK,C1);
    sevenseg(C1, full, seg);
endmodule
