`timescale 1ns / 1ps

module sevenseg2( input clock, start, output reg [3:0]an = 4'b0, reg [6:0]seg = 7'b0);
    wire C;
    reg [2:0] COUNT = 3'b0;
    segclock2 clock1(clock, start, C);
    
    always @ (posedge C) begin
        COUNT <= (COUNT==3'b100)?3'b000:COUNT + 1;
        case(COUNT)
        3'b000:
            begin
            seg <= 7'b0010010;
            an <= 4'b0111;
            end 
        3'b001:
            begin 
            seg <= 7'b0001000;
            an <= 4'b1011;
            end
        3'b010:
            begin 
            seg <= 7'b0001110;
            an <= 4'b1101;
            end
        3'b011: 
            begin
            seg <= 7'b0000110;
            an <= 4'b1110;
            end
        default: 
            begin
            seg <= 7 'b0000000;
            an <= 4'b1111;
            end
        endcase     
    end
endmodule
