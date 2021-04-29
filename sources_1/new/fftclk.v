`timescale 1ns / 1ps

module fftclk(input clk, output reg led = 0);
reg [12:0] COUNT = 13'b0;
always @ (posedge clk) begin
    COUNT<=(COUNT==13'b1100001101010)?13'b0:COUNT + 1;
    led<=(COUNT==13'b0)?~led:led;
end

endmodule
