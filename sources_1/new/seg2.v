`timescale 1ns / 1ps

module seg2(input clock, trigger, A, reset, output reg fail = 0, reg [6:0] seg );
       wire C;
       reg index = 0;
       reg [3:0] COUNT = 4'b0;
       debounceclock ck1(clock, C);
    always @ (posedge clock) begin
        fail <= (reset==1)?0:(seg == 7'b1000000)?1:fail;
        index <= (reset==1)?0:(A == 1)?1:index;
    end
    always @ (posedge C) begin
        COUNT <=(reset==1)?4'b0:(trigger == 0)?COUNT:COUNT + 1;
        case(COUNT)
        4'b0000://15
        begin
        case(index)
            1'b0:seg<=7'b0001110;
            1'b1:seg<=7'b0000010;
        endcase
        end
        4'b0001://14
        begin
        case(index)
            1'b0:seg<=7'b0000110;
            1'b1:seg<=7'b0010010;
       endcase
        end
        4'b0010://13
        begin
        case(index)
            1'b0:seg<=7'b0100001;
            1'b1:seg<=7'b0011001;
        endcase
        end
        4'b0011://12
        begin
        case(index)
            1'b0:seg<=7'b1000110;
            1'b1:seg<=7'b0110000;    
        endcase
        end
        4'b0100://11
        begin
        case(index)
            1'b0:seg<=7'b0000011;
            1'b1:seg<=7'b0100100;
        endcase
        end
        4'b0101://10
        begin
        case(index)
            1'b0:seg<=7'b0001000;
            1'b1:seg<=7'b1111001;
        endcase
        end
        4'b0110://9
        begin
        case(index)
            1'b0:seg<=7'b0010000;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b0111://8
        begin
        case(index)
            1'b0:seg<=7'b0000000;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1000://7
        begin
        case(index)
            1'b0:seg<=7'b1111000;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1001://6
        begin
        case(index)
            1'b0:seg<=7'b0000010;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1010://5
        begin
        case(index)
            1'b0:seg<=7'b0010010;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1011://4
        begin
        case(index)
            1'b0:seg<=7'b0011001;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1100://3
        begin
        case(index)
            1'b0:seg<=7'b0110000;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1101://2
        begin
        case(index)
            1'b0:seg<=7'b0100100;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1110://1
        begin
        case(index)
            1'b0:seg<=7'b1111001;
            1'b1:seg<=7'b1000000;
        endcase
        end
        4'b1111://0
        seg<=7'b1000000;
        endcase
    end
endmodule
