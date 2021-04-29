`timescale 1ns / 1ps

module clock3(input clock, output reg led);
    reg [17:0]COUNT = 18'b0;
    
    always @ (posedge clock) begin
        COUNT <= (COUNT==18'b100000000010100010)?18'b000000000000000001:COUNT + 1;
        led <= (COUNT==18'b000000000000000001)?~led:led;
    end
endmodule
