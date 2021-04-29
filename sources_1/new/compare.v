`timescale 1ns / 1ps

module compare(input clk, [19:0] bin1, [19:0] bin2, [19:0] bin3, [19:0] bin4, output reg [1:0] index );
always @ (posedge clk) begin
    if((bin1>=bin2)&&(bin1>=bin3)&&(bin1>=bin4)) begin
        index <= 2'b00;
    end else if((bin2>=bin1)&&(bin2>=bin3)&&(bin2>=bin4)) begin
        index <= 2'b01;
    end else if((bin3>=bin1)&&(bin3>=bin2)&&(bin3>=bin4)) begin
        index <= 2'b10;
    end else begin
        index <= 2'b11;
    end
end
endmodule
