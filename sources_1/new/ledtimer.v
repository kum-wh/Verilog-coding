`timescale 1ns / 1ps

module ledtimer(input CLOCK, output reg timer2 = 0);
    reg [26:0]COUNT = 27'b0;
    reg [23:0]COUNT2 = 24'b0;
    always @(posedge CLOCK) begin
        COUNT <= COUNT + 1;
        COUNT2 <= COUNT2 + 1;
        timer2 <= (COUNT2==24'b0)?~timer2:timer2;//3HZ
    end
endmodule
