`timescale 1ns / 1ps

module heightscale(input [19:0] data, output [9:0] outdata );
    assign outdata = (data>=20'd25000)?10'b1111111111:(data>=20'd20000)?10'b0111111111:(data>=20'd15000)?10'b0011111111:(data>=20'd10000)?10'b0001111111:(data>=20'd8000)?10'b0000111111:(data>=20'd5000)?10'b0000011111:(data>=20'd55000)?10'b0000001111:(data>=20'd1000)?10'b0000000111:(data>=20'd500)?10'b0000000011:(data>=20'd50)?10'b0000000001:10'b0;
endmodule
