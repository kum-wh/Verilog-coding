`timescale 1ns / 1ps
//B for bg
//C colour for frame
//D,E,F colour for bars
module colourselecter(input clock, [1:0] A, output reg [15:0] B, reg [15:0] C, reg [15:0] D, reg [15:0] E, reg [15:0] F);
    always @ (posedge clock) begin
        case(A)
            2'b00: 
                begin
                   B <= 16'b0000000000000000;
                   C <= 16'b1111111111111111;
                   D <= 16'b0000011111100000;
                   E <= 16'b1111111111100000;
                   F <= 16'b1111100000000000;
                end
            2'b01: 
                begin
                    B <= 16'b1111111111111111;
                    C <= 16'b0000000000000000;
                    D <= 16'b0000011111100000;
                    E <= 16'b1111111111100000;
                    F <= 16'b1111100000000000;
                end
            2'b10: 
                begin
                    B <= 16'b0000000000011111;
                    C <= 16'b1111100000000000;
                    D <= 16'b0000000000000000;
                    E <= 16'b0001100001100011;
                    F <= 16'b1111111111111111;
                end
            2'b11: 
                begin
                    B <= 16'b0000100000000000;
                    C <= 16'b1111111111111111;
                    D <= 16'b1111100000000000;
                    E <= 16'b1111101111100000;
                    F <= 16'b0000000000011111;
                end
        endcase
    end
    
endmodule
