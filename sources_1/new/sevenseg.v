`timescale 1ns / 1ps

module sevenseg(input timer, input full, output [7:0]segment);

    reg [3:0] COUNT = 4'b0000;
    reg [7:0]seg = 8'b00000001;
    reg [7:0]seg1 = 8'b01010100;
    reg [7:0]seg2 = 8'b11101110;
    reg [7:0]seg3 = 8'b00001010;
    reg [7:0]seg4 = 8'b00101010;
    reg [7:0]seg5 = 8'b00001100;
    reg [7:0]seg6 = 8'b11110110;
    reg [7:0]seg7 = 8'b00000010;
    reg [7:0]seg8 = 8'b00011100;
    reg [7:0]seg9 = 8'b10011110;
    reg [7:0]seg10 = 8'b00111000;
    
    assign segment = (COUNT==4'b0000)?~seg:
                     (COUNT==4'b0001)?~seg1:
                     (COUNT==4'b0010)?~seg2:
                     (COUNT==4'b0011)?~seg3:
                     (COUNT==4'b0100)?~seg4:
                     (COUNT==4'b0101)?~seg5:
                     (COUNT==4'b0110)?~seg4:
                     (COUNT==4'b0111)?~seg6:
                     (COUNT==4'b1000)?~seg7:
                     (COUNT==4'b1001)?~seg8:
                     (COUNT==4'b1010)?~seg9:
                     (COUNT==4'b1011)?~seg10:
                     (COUNT==4'b1100)?~seg9:
                     (COUNT==4'b1101)?~seg8:
                     8'b11111111;
    
    always @ (posedge timer) begin
            COUNT <= (full==1)?((COUNT==4'b1101)?4'b0000:(COUNT + 1)):4'b0000;
    end
    
endmodule
