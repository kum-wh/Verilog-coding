`timescale 1ns / 1ps

module firsthalf(input CLOCK, output [7:0]seg, output[3:0] an, output [12:0] LED, output reg index =0);
wire full;
wire [12:0] A;
wire [7:0] C;

LED(CLOCK,full,A);
event2(CLOCK, index, C);
always @ (posedge CLOCK) begin
    index <= (full==1)?(index|1'b1):index;
end
assign LED = A;
assign seg = C;
assign an = (index==1)?4'b1001:4'b1111;
endmodule
