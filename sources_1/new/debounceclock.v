`timescale 1ns / 1ps

module debounceclock(input clock, output reg led = 0 );
reg [20:0] COUNT = 21'b0;
    
    always @ (posedge clock) begin
        COUNT <= COUNT + 1;
        led <= (COUNT == 21'b0)? ~led:led;
    end 
endmodule
