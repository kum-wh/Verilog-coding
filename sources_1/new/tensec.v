`timescale 1ns / 1ps

module tensec(input clock, start, resett, output led);
    wire C;
    wire reset;
    reg starter = 0;
    reg [3:0] COUNT =  4'b0000;
    assign led = (starter==1)?(COUNT<=4'b1001)?1:0:0;
    assign reset = (starter==1)?((COUNT==4'b1001)?1:0):0;
    segclock clock1(clock, starter, C);
    always @ (posedge clock) begin
        starter<=(resett==1)?0:(reset==1)?0:(start==1)?1:starter;
    end
    always @ (posedge C) begin
        COUNT <= (starter==0)?4'b0:COUNT + 1;
    end
endmodule
