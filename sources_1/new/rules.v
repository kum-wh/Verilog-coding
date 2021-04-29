`timescale 1ns / 1ps

module rules(input clock, [2:0]C1, [2:0]C2, [2:0]C3, output reg trigger = 0 );
   always @ (posedge clock) begin
   case(C1)
   3'b001:trigger <= (C2==3'b000)?1:(C3==3'b000)?1:0;
   3'b010:trigger <= (C2<=3'b001)?1:(C3<=3'b001)?1:0;
   default: trigger <= 0;
   endcase
   end
endmodule
