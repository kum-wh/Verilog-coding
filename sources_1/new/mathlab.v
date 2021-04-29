/*
`timescale 1ns / 1ps

module mathlab(input clk, frame_begin, pixel_index, output data );
reg [15:0] A [6143:0];
    initial begin
        $readmemh("",A);
        end
        assign data = A[pixel_index];
endmodule
*/