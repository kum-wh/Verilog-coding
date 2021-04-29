`timescale 1ns / 1ps

module blinkclock(input clock, output reg led );
reg [25:0]COUNT = 26'b0;
always @ (posedge clock) begin
    COUNT <= (COUNT==26'b10000000000000101000110111)?26'b0:COUNT + 1;
    led <= (COUNT==26'b0)?~led:led;
end
endmodule
