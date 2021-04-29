`timescale 1ns / 1ps

module clock2(input clock, start, output reg led = 0);
    reg [24:0] COUNT = 25'b0;
    
    always @ (posedge clock) begin
        COUNT <= (start==0)?25'b0:(COUNT==25'b1000000000101100100000000)?25'b0:COUNT + 1;
        led <= (COUNT == 25'b0)?~led:led;
    end
endmodule
