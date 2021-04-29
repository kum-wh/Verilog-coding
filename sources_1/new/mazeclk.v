`timescale 1ns / 1ps

module mazeclk(input clk, timer, sw, U, D, L, R, C, [12:0] index, output [15:0] data);
    reg [2:0] move = 3'b0;

    topmaze fa0(clk, timer, C, move, index, data);
    always @ (posedge timer) begin
        move<=(sw==0)?3'b000:(L==1)?3'b001:(R==1)?3'b010:(D==1)?3'b011:(U==1)?3'b100:3'b000;
    end

endmodule