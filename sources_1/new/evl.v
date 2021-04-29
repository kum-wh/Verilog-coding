`timescale 1ns / 1ps

module evl(input CLOCK, output reg [2:0] C = 3'b000 );
    always @ (posedge CLOCK) begin
        C <=(C + 1);
    end
endmodule
