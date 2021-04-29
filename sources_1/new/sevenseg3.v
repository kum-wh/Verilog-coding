`timescale 1ns / 1ps

module sevenseg3(input clock, start, [3:0]sw, output [3:0]an, [6:0]seg );
    wire index;
    wire [3:0]C1;
    wire [6:0]C2;
    wire [3:0]C3;
    wire [6:0]C4;
    wire C5;
    wire [3:0]C6;
    wire [7:0]C7;
    reg [2:0] COUNT = 3'b0;
    reg index2 = 0;
    segclock clock1(clock, start, C5);
    sevenseg fa0(clock, start, index, C1, C2);
    sevenseg2 fa1(clock, start, C3, C4);
    sevenseg4 fa2(clock, start, C6, C7);
    assign an[0] = (sw[0]==1)?1:(index2==1)?C6[0]:(index==1)?C3[0]:C1[0];
    assign an[1] = (sw[1]==1)?1:(index2==1)?C6[1]:(index==1)?C3[1]:C1[1];
    assign an[2] = (sw[2]==1)?1:(index2==1)?C6[2]:(index==1)?C3[2]:C1[2];
    assign an[3] = (sw[3]==1)?1:(index2==1)?C6[3]:(index==1)?C3[3]:C1[3];
    assign seg = (index2==1)?C7:(index==1)?C4:C2;
    
    always @ (posedge C5) begin
        COUNT <= (index==1)?(COUNT + 1):3'b0;
        index2 <= (COUNT==3'b100)?1:index2;
    end
    
endmodule
