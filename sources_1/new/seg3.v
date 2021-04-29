`timescale 1ns / 1ps

module seg3(input start, clock, btnL, btnC, btnR, btnU, stop, output t4, t5, t6, t7, t8, reg [6:0]seg );
wire A; wire B; wire C;
wire fail; wire trigger; wire trigger2;
wire t1; wire t2; wire t3;
wire [6:0]S0; wire [6:0]S1; wire [6:0]S2; wire [6:0]S3;
wire [2:0]C1; wire [2:0]C2; wire [2:0]C3;
wire x1; wire x2; wire x3;
reg [2:0] COUNT = 3'b0;
clock3 ck(clock, C);
timer ck2(clock, start, trigger2, B, A);
reset fa0(clock, btnU, B);
seg2 fa1(clock, trigger, A, B, fail, S0);
seg1 fa2(start, stop, clock, btnR, B, C2, C3, x1, t1, S1, C1);
seg1 fa3(start, stop, clock, btnC, B, C1, C3, x2, t2, S2, C2);
seg1 fa4(start, stop, clock, btnL, B, C1, C2, x3, t3, S3, C3);
assign trigger = t1 | t2 | t3;
assign trigger2 = x1 & x2 & x3;
assign t4 = t1;
assign t5 = t2;
assign t6 = t3;
assign t7 = fail;
assign t8 = B;
always @ (posedge C) begin
   COUNT <= COUNT + 1;
   case(COUNT)
   2'b00:seg <= (fail==1)?7'b1000111:S0;
   2'b01:seg <= (fail==1)?7'b1001111:S1;
   2'b10:seg <= (fail==1)?7'b0001000:S2;
   2'b11:seg <= (fail==1)?7'b0001110:S3;

   endcase 
end
endmodule
