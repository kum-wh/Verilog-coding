`timescale 1ns / 1ps

module segclock(input clock, start, output reg led = 0);
    reg [25:0] COUNT = 26'b0;
    
    always @ (posedge clock) begin
        COUNT<=(start==0)?26'b0:(COUNT==26'b11111111111101110101100001)?26'b00000000000000000000000001:COUNT + 1;
        led<=(COUNT==26'b00000000000000000000000001)?~led:led;
    end
endmodule
