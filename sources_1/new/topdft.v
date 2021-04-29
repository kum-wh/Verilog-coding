`timescale 1ns / 1ps

module topdft(input clk, [11:0] data, [12:0] index, output [15:0]oled);
wire timer;
wire [19:0] bin1; wire [19:0] bin2; wire [19:0] bin3; wire [19:0] bin4;
wire [15:0] scaled1; wire [15:0] scaled2; wire [15:0]scaled3; wire [15:0]scaled4;
fftclk fa0(clk, timer);
myfft fa1(clk, timer, data, bin1, bin2, bin3, bin4);
heightscale fa2(bin1, scaled1);
heightscale fa3(bin2, scaled2);
heightscale fa4(bin3, scaled3);
heightscale fa5(bin4, scaled4);
fftgraph fa6(clk, scaled1, scaled2, scaled3, scaled4, index, oled);
endmodule
