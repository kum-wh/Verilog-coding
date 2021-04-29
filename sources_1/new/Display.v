`timescale 1ns / 1ps
//oled1 is loading, oled2 is welcome //oled3 selection page //oled4 is maze //oled5 is soundbar //oled7 is fft
module Display(input CLOCK, [11:0]micin, [15:0] tester, btnC, btnU, btnR, btnL, btnD, [15:0] sw, output [6:0]JX );
wire timer; wire U; wire L; wire R; wire D; wire load;
wire reset; wire frame_begin; wire sending_pixels; wire sample_pixel;
wire [12:0] pixel_index; wire [4:0] teststate;wire [15:0] oled_data;
wire[15:0]oled1;wire[15:0]oled2;wire[15:0]oled3;wire[15:0]oled4;
wire[15:0]oled5;wire[15:0]oled6;wire [15:0]oled7;
reg [1:0] framesel; reg [1:0] soundbarpos; reg [1:0] coloursel;
clock ck1(CLOCK, timer);
debounce fa0(CLOCK, btnC, reset);   
debounce fa1(CLOCK, btnU, U);
debounce fa2(CLOCK, btnL, L);
debounce fa3(CLOCK, btnR, R);
debounce fa4(CLOCK, btnD, D);
frame fa5(CLOCK, pixel_index, load, oled1);//loading
Welcome fa6(CLOCK, pixel_index, oled2);
modesel fa7(CLOCK, pixel_index, oled3);
display2 fa8(CLOCK, framesel, soundbarpos, coloursel, tester, pixel_index, oled4);
topdft fa9(CLOCK, micin, pixel_index, oled5);
mazeclk fa10(CLOCK, timer, sw[12], U, D, L, R, reset, pixel_index, oled6);
geodash fa11(CLOCK, timer, reset, sw[11], U, D, pixel_index, oled7);

assign oled_data = (load==0)?oled1:(sw[15]==0)?oled2:(sw[14]==1)?oled4:(sw[13]==1)?oled5:(sw[12]==1)?oled6:(sw[11]==1)?oled7:oled3;
Oled_Display fa12(timer, reset, frame_begin, sending_pixels, sample_pixel, pixel_index, oled_data, JX[0], JX[1], JX[2], JX[3], JX[4], JX[5], JX[6], teststate);

    always @ (posedge timer) begin
        framesel <= (sw[15]==0)?framesel:(sw[14]==0)?framesel:((framesel==2'b11)?2'b00:(U == 1)? framesel + 1: framesel);
        soundbarpos <= (sw[15]==0)?soundbarpos:(sw[14]==0)?soundbarpos:((L==1)?soundbarpos + 1:soundbarpos);
        coloursel <= (sw[15]==0)?coloursel:(sw[14]==0)?coloursel:((R==1)?coloursel + 1:coloursel);
    end
endmodule