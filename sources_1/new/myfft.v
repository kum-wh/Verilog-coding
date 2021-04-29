`timescale 1ns / 1ps
//8sample dft valid range of 4 frequency bins//plenty of overflow issues
module myfft(input clk, timer, [11:0] data, output [19:0] z0, [19:0] z1, [19:0] z2, [19:0] z3);
wire signed [15:0] data0; wire signed [15:0] data1; wire signed [15:0] data2; wire signed [15:0] data3; wire signed [15:0] data4; wire signed [15:0] data5; wire signed [15:0] data6; wire signed [15:0] data7;
reg [15:0] data01; reg [15:0] data11; reg [15:0] data21; reg [15:0] data31; reg [15:0] data41; reg [15:0] data51; reg [15:0] data61; reg[15:0] data71;
wire signed [15:0] x0; wire signed [15:0] x1; wire signed [15:0] x2; wire signed [15:0] x3; wire signed [15:0] x4; wire signed [15:0] x5; wire signed [15:0] x6; wire signed [15:0] x7;//re
wire signed [15:0] y0; wire signed [15:0] y1; wire signed [15:0] y2; wire signed [15:0] y3; wire signed [15:0] y4; wire signed [15:0] y5; wire signed [15:0] y6; wire signed [15:0] y7;//im
wire [15:0] x01; wire [15:0] x11; wire [15:0] x21; wire [15:0] x31; wire [15:0] x41; wire [15:0] x51; wire [15:0] x61; wire [15:0] x71;//re
wire [15:0] y01; wire [15:0] y11; wire [15:0] y21; wire [9:0] y31; wire [15:0] y41; wire [15:0] y51; wire [15:0] y61; wire [15:0] y71;//im
reg [3:0] COUNT; reg [24:0] COUNT2; reg valid; reg outvalid;
wire [15:0] mean;

assign mean = (data01 + data11 + data21 + data31 + data41 + data51 + data61 + data71)/8;

assign data0 = (outvalid==0)?16'b0:data01 - mean;
assign data1 = (outvalid==0)?16'b0:data11 - mean;
assign data2 = (outvalid==0)?16'b0:data21 - mean;
assign data3 = (outvalid==0)?16'b0:data31 - mean;
assign data4 = (outvalid==0)?16'b0:data41 - mean;
assign data5 = (outvalid==0)?16'b0:data51 - mean;
assign data6 = (outvalid==0)?16'b0:data61 - mean;
assign data7 = (outvalid==0)?16'b0:data71 - mean;


assign x0 = data0 + data1 + data2 + data3 + data4 + data5 + data6 + data7;
assign y0 = 0;
assign x1 = data0 + $signed(data1*7/10)- $signed(data3*7/10)-data4-$signed(data5*7/10)+$signed(data7*7/10);
assign y1 = $signed(data1*-7/10) - data2 - $signed(data3*7/10) + $signed(data5*7/10) + data6 + $signed(data7*7/10);
assign x2 = data0 - data2 + data4 - data6;
assign y2 = -data1 + data3 - data5 + data7;
assign x3 = data0 - $signed(data1*7/10) + $signed(data3*7/10) - data4 + $signed(data5*7/10) - $signed(data7*7/10);
assign y3 = $signed(data1*-7/10) + data2 - $signed(data3*7/10) + $signed(data5*7/10) - data6 + $signed(data7*7/10);
assign x4 = data0 - data1 + data2 - data3 + data4 - data5 + data6 - data7;
assign y4 = 0;
assign x5 = data0 - $signed(data1*7/10) + $signed(data3*7/10) - data4 + $signed(data5*7/10) - $signed(data7*7/10);
assign y5 = $signed(data1*7/10) - data2 + $signed(data3*7/10) - $signed(data5*7/10) + data6 - $signed(data7*7/10);
assign x6 = data0 - data2 + data4 - data6;
assign y6 = data1 - data3 + data5 - data7;
assign x7 = data0 + $signed(data1*7/10) - $signed(data3*7/10) - data4 - $signed(data5*7/10) + $signed(data7*7/10);
assign y7 = $signed(data1*7/10) + data2 + (data3*7/10) - $signed(data5*7/10) - data6 - $signed(data7*7/10);

assign x01 = (x0<0)?-x0:x0;
assign x11 = (x1<0)?-x1:x1;
assign x21 = (x2<0)?-x2:x2;
assign x31 = (x3<0)?-x3:x3;
assign x41 = (x4<0)?-x4:x4;
assign x51 = (x5<0)?-x5:x5;
assign x61 = (x6<0)?-x6:x6;
assign x71 = (x7<0)?-x7:x7;
assign y01 = (y0<0)?-y0:y0;
assign y11 = (y1<0)?-y1:y1;
assign y21 = (y2<0)?-y2:y2;
assign y31 = (y3<0)?-y3:y3;
assign y41 = (y4<0)?-y4:y4;
assign y51 = (y5<0)?-y5:y5;
assign y61 = (y6<0)?-y6:y6;
assign y71 = (y7<0)?-y7:y7;

assign z0 = (x01 * x01);
assign z1 = (x11 * x11) + (y11 * y11);
assign z2 = (x21 * x21) + (y21 * y21);
assign z3 = (x31 * x31) + (y31 * y31);

always @ (posedge clk) begin
    COUNT2 <= COUNT2 + 1;
    valid <= (COUNT==4'b1000)?0:(COUNT2==25'b0)?1:valid;
    outvalid <=(COUNT==4'b1000)?1:(COUNT2==25'b0)?0:outvalid;
    case(COUNT)
        4'b0000:data01 <= (valid==0)?data01:data;
        4'b0001:data11 <= (valid==0)?data11:data;
        4'b0010:data21 <= (valid==0)?data21:data;
        4'b0011:data31 <= (valid==0)?data31:data;
        4'b0100:data41 <= (valid==0)?data41:data;
        4'b0101:data51 <= (valid==0)?data51:data;
        4'b0110:data61 <= (valid==0)?data61:data;
        4'b0111:data71 <= (valid==0)?data71:data;
    endcase
end 
always @ (posedge timer) begin
    COUNT <= (COUNT==4'b1000)?4'b0:(valid==0)?COUNT:COUNT + 1;
end
endmodule
