`timescale 1ns / 1ps

module clock1(input clock, output reg led = 0);
    reg [24:0] COUNT = 25'b0;
    
    always @ (posedge clock) begin
        COUNT <= (COUNT==25'b1000000000101100100000000)?25'b0:COUNT + 1;
        led <= (COUNT == 25'b0)?~led:led;
    end
endmodule
