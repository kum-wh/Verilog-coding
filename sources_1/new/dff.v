`timescale 1ns / 1ps

module dff(input ck, btn, output reg A );
    always @ (posedge ck) begin
        A <= btn;
    end
endmodule
