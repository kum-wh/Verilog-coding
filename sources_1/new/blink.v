`timescale 1ns / 1ps

module blink(input CLOCK, output reg led12 = 0 , output [11:0] LED);
    assign LED = 12'b111111111111;
    reg [27:0] COUNT = 28'b0;

    always @ (posedge CLOCK) begin
        COUNT <= (COUNT + 1);
        led12 <= ( COUNT == 28'b0 ) ? ~led12 : led12 ;
    end
    
endmodule
