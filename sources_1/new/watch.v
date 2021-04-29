`timescale 1ns / 1ps

module watch( input CLOCK, output reg timer = 0);
   reg [24:0] COUNT = 25'b0;
   
 always @ (posedge CLOCK) begin
    COUNT <= COUNT + 1;
    timer <= ( COUNT == 25'b0 ) ? ~timer : timer ;
 end
 
endmodule
