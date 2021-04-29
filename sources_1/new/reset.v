`timescale 1ns / 1ps

module reset(input clock, btn, output index );
    wire C1; wire C2; wire C3;
    debounceclock ck1(clock, C3);
    my_dff dff1 (C3, btn, C1);
    my_dff dff2 (C3, C1, C2);
    assign index = (C1 & (~C2));
endmodule
