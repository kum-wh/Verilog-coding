`timescale 1ns / 1ps

module clock(input ck, output reg clk6p25m );
reg [2:0] COUNT = 3'b0;

always @ (posedge ck) begin 
    COUNT <= COUNT + 1;
    clk6p25m <= (COUNT == 3'b0)?~clk6p25m:clk6p25m;
end

endmodule
