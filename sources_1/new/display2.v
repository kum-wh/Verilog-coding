`timescale 1ns / 1ps
//compiles all the soundbar
//U changes the frame number
//L changes the position of the bar

module display2(input clock, [1:0] U, [1:0] L, [1:0] R, [15:0] tester, [12:0] index, output reg [15:0] data);
wire [15:0] B1; wire [15:0] B2; wire [15:0] B3; wire [15:0] B4;
wire [15:0] C1; wire [15:0] C2; wire [15:0] C3; wire [15:0] C4;
wire [15:0] D1; wire [15:0] D2; wire [15:0] D3; wire [15:0] D4;

soundbar fa0(clock, R, tester, index, B1);
soundbar12 fa1(clock, R, tester, index, B2);
soundbar13 fa2(clock, R, tester, index, B3);
soundbar14 fa3(clock, R, B4);
soundbar2 fa4(clock, R, tester, index, C1);
soundbar22 fa5(clock, R, tester, index, C2);
soundbar23 fa6(clock, R, tester, index, C3);
soundbar24 fa7(clock, R, tester, index, C4);
soundbar3 fa8(clock, R, tester, index, D1);
soundbar32 fa9(clock, R, tester, index, D2);
soundbar33 fa10(clock, R, tester, index, D3);
soundbar34 fa11(clock, R, tester, index, D4);

    always @ (posedge clock) begin
        case(U)
            2'b00: data<= (L==2'b00)?B1:(L==2'b01)?B2:(L==2'b10)?B3:B4;
            2'b01: data<= (L==2'b00)?C1:(L==2'b01)?C2:(L==2'b10)?C3:C4;
            2'b10: data<= (L==2'b00)?D1:(L==2'b01)?D2:(L==2'b10)?D3:D4;
           endcase
    end

endmodule
