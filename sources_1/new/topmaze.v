`timescale 1ns / 1ps
//000 stay//001 left // 010 is right // 011 is down//100 is up
module topmaze( input clk, timer, C, [2:0] move, [12:0] index, output [15:0] data);
wire [15:0] oled0;wire [15:0] oled1;wire [15:0] oled2;wire [15:0] oled3;wire [15:0] oled4;wire [15:0] oled5;wire [15:0] oled6;wire [15:0] oled7;wire [15:0] oled8;
wire [15:0] oled9;wire [15:0] oled10;wire [15:0] oled11;wire [15:0] oled12;wire [15:0] oled13;
reg [3:0] pos;
reg [1:0] won;
assign data = (won==2'b01)?oled13:(pos==4'b0000)?oled0:(pos==4'b0001)?oled1:(pos==4'b0010)?oled2:(pos==4'b0011)?oled3:(pos==4'b0100)?oled4:(pos==4'b0101)?oled5:(pos==4'b0110)?oled6:(pos==4'b0111)?oled7:(pos==4'b1000)?oled8:(pos==4'b1001)?oled9:(pos==4'b1010)?oled10:(pos==4'b1011)?oled11:oled12;
drawmaze   fa0(clk, index, oled0);
drawmaze1  fa1(clk, index, oled1);
drawmaze2  fa2(clk, index, oled2);
drawmaze3  fa3(clk, index, oled3);
drawmaze4  fa4(clk, index, oled4);
drawmaze5  fa5(clk, index, oled5);
drawmaze6  fa6(clk, index, oled6);
drawmaze7  fa7(clk, index, oled7);
drawmaze8  fa8(clk, index, oled8);
drawmaze9  fa9(clk, index, oled9);
drawmaze10 fa10(clk, index, oled10);
drawmaze11 fa11(clk, index, oled11);
drawmaze12 fa12(clk, index, oled12);
drawwin    fa13(clk, index, oled13);
always @ (posedge timer) begin
    won<=(won==2'b10)?2'b0:won;
    case(pos)
        4'b0000:
            begin
                pos<=(move==3'b001)?4'b0001:pos;
            end
        4'b0001:
            begin
                pos<=(move==3'b011)?4'b0100:(move==3'b010)?4'b0000:pos;
            end
        4'b0010:
            begin
                pos<=(move==3'b010)?4'b0011:(move==3'b011)?4'b0101:pos;
            end
        4'b0011:
            begin
                pos<=(move==3'b001)?4'b0010:pos;
            end
        4'b0100:
            begin
                pos<=(move==3'b010)?4'b0101:(move==3'b011)?4'b0111:(move==3'b100)?4'b0001:pos;
            end
        4'b0101:
            begin
                pos<=(move==3'b001)?4'b0100:(move==3'b010)?4'b0110:(move==3'b100)?4'b0010:pos;
            end
        4'b0110:
            begin
                pos<=(move==3'b001)?4'b0101:(move==3'b011)?4'b1100:pos;
            end
        4'b0111:
            begin
                pos<=(move==3'b010)?4'b1000:(move==3'b011)?4'b1001:(move==3'b100)?4'b0100:pos;
            end
        4'b1000:
            begin
                pos<=(move==3'b001)?4'b0111:(move==3'b011)?4'b1011:pos;
            end
        4'b1001:
            begin
                pos<=(move==3'b100)?4'b0111:pos;
            end
        4'b1010:
            begin
                won <= (C==1)?won+1:won;
                pos <=(won==2'b10)?4'b0000:pos;
            end
        4'b1011:
            begin
                pos<=(move==3'b001)?4'b1010:(move==3'b100)?4'b1000:pos;
            end
        4'b1100:
            begin
                pos<=(move==3'b100)?4'b0110:pos;
            end
       endcase
end

endmodule
