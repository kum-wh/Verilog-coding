`timescale 1ns / 1ps

module discharge(input CLOCK, input correct, output reg [12:0]LED = 13'b1111111111, output empty);
    wire A;
    reg [3:0] COUNT = 4'b0000;
    dischargetimer(CLOCK, A);
    
    assign empty = (LED==13'b0000000000000)?1:0;
    
    always @ (posedge A) begin
        COUNT <= (correct==1)?(COUNT + 1):4'b0;
        case(COUNT)
        4'b0000:LED<=13'b1111111111111;
        4'b0001:LED<=13'b0111111111111;
        4'b0010:LED<=13'b0011111111111;
        4'b0011:LED<=13'b0001111111111;
        4'b0100:LED<=13'b0000111111111;
        4'b0101:LED<=13'b0000011111111;
        4'b0110:LED<=13'b0000001111111;
        4'b0111:LED<=13'b0000000111111;
        4'b1000:LED<=13'b0000000011111;
        4'b1001:LED<=13'b0000000001111;
        4'b1010:LED<=13'b0000000000111;
        4'b1011:LED<=13'b0000000000011;
        4'b1100:LED<=13'b0000000000001;
        default:LED<=13'b0000000000000;
        endcase
        
    end
    
endmodule
