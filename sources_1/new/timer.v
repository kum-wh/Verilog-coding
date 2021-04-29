`timescale 1ns / 1ps

module timer(input clock, start, stop, reset, output out );
wire C;
reg [3:0] COUNT = 4'b0;
clock2 ck(clock, start, C);
assign out = (stop==1)?0:(reset==1)?0:(COUNT==4'b1010)?1:0;
always @ (posedge C) begin
    COUNT <= (reset==1)?4'b0:(start==0)?4'b0:COUNT + 1;
end

endmodule
