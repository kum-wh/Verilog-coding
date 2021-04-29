`timescale 1ns / 1ps

module soundbar14(input clock, [1:0] R, output reg [15:0] data  );
    wire [15:0] A; wire [15:0] B; wire [15:0] C; wire [15:0] D; wire [15:0] E;
    colourselecter fa0(clock, R, A, B, C, D, E);
    always @ (posedge clock) begin
        data<=A;
    end
endmodule
