`timescale 1ns / 1ps

module fingerprint(input clock, btn, output reg index = 0 , reg [15:0]led = 16'b0);
    wire C;
    reg [4:0] COUNT = 5'b0;    
    clock1 ck1(clock, C);
    
    always @ (posedge clock) begin
        index <= (led==16'b1111111111111111)?((btn==0)?1:index):index;
    end
    
    always @ (posedge C) begin
        COUNT<=(index==1)?5'b10000:(btn==0)?5'b0:COUNT+1;
        case(COUNT)
        5'b00000:led<=16'b0000000000000000;
        5'b00001:led<=16'b0000000000000001;
        5'b00010:led<=16'b0000000000000011;
        5'b00011:led<=16'b0000000000000111;
        5'b00100:led<=16'b0000000000001111;
        5'b00101:led<=16'b0000000000011111;
        5'b00110:led<=16'b0000000000111111;
        5'b00111:led<=16'b0000000001111111;
        5'b01000:led<=16'b0000000011111111;
        5'b01001:led<=16'b0000000111111111;
        5'b01010:led<=16'b0000001111111111;
        5'b01011:led<=16'b0000011111111111;
        5'b01100:led<=16'b0000111111111111;
        5'b01101:led<=16'b0001111111111111;
        5'b01110:led<=16'b0011111111111111;
        5'b01111:led<=16'b0111111111111111;
        default:led<=16'b1111111111111111;
        endcase
    end
endmodule
