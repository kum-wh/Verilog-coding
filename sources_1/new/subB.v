`timescale 1ns / 1ps

module subB(input start, clock, btnL, btnC, btnR, btnU, output [6:0]seg, reg [3:0]an);
wire A; wire [2:0]B; wire C;
wire t1; wire t2; wire t3; wire t4;
wire fail; wire stop;
reg [2:0] COUNT = 3'b0;
clock3 ck(clock, C);
blinkclock ck2(clock, A);
tensec ten1(clock, t1, t4, B[0]);
tensec ten2(clock, t2, t4, B[1]);
tensec ten3(clock, t3, t4, B[2]);
seg3 fa0(start, clock, btnL, btnC, btnR, btnU, stop, t1, t2, t3, fail, t4, seg);
assign stop = B[0] | B[1] | B[2];
always @ (posedge C) begin
   COUNT <= COUNT + 1;
   case(COUNT)
   2'b00:an<=4'b1110;
   2'b01:
   case(B)
           3'b000:an<=4'b1101;
           3'b001:
           begin
               an[0]<=1;
               an[1]<=(fail==1)?0:A;
               an[2]<=1;
               an[3]<=1;
           end
           3'b010:an<=4'b1101;
           3'b100:an<=4'b1101;
   endcase
   2'b10:
   case(B)
           3'b000:an<=4'b1011;
           3'b001:an<=4'b1011;
           3'b010:
           begin
               an[0]<=1;
               an[1]<=1;
               an[2]<=(fail==1)?0:A;
               an[3]<=1;
           end
           3'b100:an<=4'b1011;
   endcase
   2'b11:
   case(B)
           3'b000:an<=4'b0111;
           3'b001:an<=4'b0111;
           3'b010:an<=4'b0111;
           3'b100:
           begin
               an[0]<=1;
               an[1]<=1;
               an[2]<=1;
               an[3]<=(fail==1)?0:A;
           end
   endcase
   endcase 
end
endmodule
