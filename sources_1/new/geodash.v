`timescale 1ns / 1ps

module geodash(input clk, timer, reset, sw, U, D, [12:0] index, output [15:0] oleddata);
    wire [15:0]data2;wire [15:0]data3; wire lost;
    reg [19:0] COUNT;reg [26:0] COUNT2;reg [4:0] COUNT3;
    reg [6:0] x1 = 7'b0;reg [6:0] x2 = 7'b0;reg [6:0] x3 = 7'b0;
    reg [1:0] pos;reg win;reg [15:0] data; reg lose;
    reg top;reg mid;reg btm;
    drawwait fa0(clk,index,data3);
    drawwin fa01(clk,index, data2);
    assign oleddata = (win==1)?data2:(lose==1)?data3:data;

    always @ (posedge timer) begin
        pos<=(sw==0)?pos:(pos==2'b11)?2'b10:(U==1)?((pos==2'b00)?2'b00:pos-1):(D==1)?pos+1:pos;
        win<=(reset==1)?0:(lose==1)?0:(COUNT3==5'b11110)?1:win;
    end
    always @ (posedge clk) begin
        COUNT<=(reset==1)?20'b0:(sw==0)?COUNT:COUNT+1;
        COUNT2<=(reset==1)?27'b0:(sw==0)?COUNT2:(COUNT2==27'b100000001000000000000000000)?27'b0:COUNT2+1;
        COUNT3<=(reset==1)?5'b0:(sw==0)?COUNT3:(COUNT2==27'b0)?COUNT3+1:COUNT3;
        top<=(x1+5==7'd95)?0:(COUNT3==5'b11101)?1:(COUNT3==5'b11100)?1:(COUNT3==5'b10100)?1:(COUNT3==5'b10000)?1:(COUNT3==5'b01111)?1:(COUNT3==5'b01110)?1:(COUNT3==5'b01010)?1:(COUNT3==5'b00110)?1:(COUNT3==5'b00001)?1:top;
        mid<=(x2+5==7'd95)?0:(COUNT3==5'b10101)?1:(COUNT3==5'b10010)?1:(COUNT3==5'b01010)?1:(COUNT3==5'b01000)?1:(COUNT3==6'b00100)?1:mid;
        btm<=(x3+5==7'd95)?0:(COUNT3==5'b11010)?1:(COUNT3==5'b11000)?1:(COUNT3==5'b10111)?1:(COUNT3==5'b10010)?1:(COUNT3==5'b10000)?1:(COUNT3==5'b01111)?1:(COUNT3==5'b01110)?1:(COUNT3==5'b01100)?1:(COUNT3==5'b01000)?1:(COUNT3==6'b00110)?1:(COUNT3==5'b00010)?1:btm;
        x1<=(reset==1)?7'b0:(x1+5==7'd95)?0:(top==0)?0:(COUNT==17'b0)?x1+1:x1;
        x2<=(reset==1)?7'b0:(x2+5==7'd95)?0:(mid==0)?0:(COUNT==17'b0)?x2+1:x2;
        x3<=(reset==1)?7'b0:(x3+5==7'd95)?0:(btm==0)?0:(COUNT==17'b0)?x3+1:x3;
        lose<=(COUNT3==10'b11111)?0:lose;
        case(pos)
            2'b00:
                begin
                    if((x1==76)&&(top==1))begin
                    lose<=1;
                    end else if((index/96>=13) && (index/96<=24))begin
                        if((top==1)&&(index%96>=x1)&&(index%96<=x1+5))begin
                            data<=16'b0;
                        end else if((index%96>=80)&&(index%96<=91))begin
                            data<=16'b1111111111111111;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end else if((index/96>=25) && (index/96<=36))begin
                        if((mid==1)&&(index%96>=x2)&&(index%96<=x2+5))begin
                            data<=16'b0;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end else if((index/96>=37) && (index/96<=48))begin
                        if((btm==1)&&(index%96>=x3)&&(index%96<=x3+5))begin
                            data<=16'b0;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end
                end
            2'b01:
                begin
                    if((x2==76)&&(mid==1))begin
                        lose<=1;
                    end else if((index/96>=13) && (index/96<=24))begin
                        if((top==1)&&(index%96>=x1)&&(index%96<=x1+5))begin
                            data<=16'b0;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end else if((index/96>=25) && (index/96<=36))begin
                        if((mid==1)&&(index%96>=x2)&&(index%96<=x2+5))begin
                            data<=16'b0;
                        end else if((index%96>=80)&&(index%96<=91))begin
                            data<=16'b1111111111111111;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end else if((index/96>=37) && (index/96<=48))begin
                        if((btm==1)&&(index%96>=x3)&&(index%96<=x3+5))begin
                            data<=16'b0;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end
                end 
            2'b10:
                begin
                    if((x3==76)&&(btm==1))begin
                    lose<=1;
                    end else if((index/96>=13) && (index/96<=24))begin
                        if((top==1)&&(index%96>=x1)&&(index%96<=x1+5))begin
                            data<=16'b0;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end if((index/96>=25) && (index/96<=36))begin
                        if((mid==1)&&(index%96>=x2)&&(index%96<=x2+5))begin
                            data<=16'b0;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end else if((index/96>=37) && (index/96<=48))begin
                        if((btm==1)&&(index%96>=x3)&&(index%96<=x3+5))begin
                            data<=16'b0;
                        end else if((index%96>=80)&&(index%96<=91))begin
                            data<=16'b1111111111111111;
                        end else begin
                            data<=16'b0000000000011111;
                        end
                    end
                end
        endcase
        if(index/96<=9)begin
            data<=16'b0000000000011111;
        end 
        if(index/96>9)begin
            if(index/96<=12)begin
                data<=16'b0000000000000000;
        end end
        if(index/96>51)begin
            data<=16'b0000000000011111;
        end 
        if(index/96<=51)begin
            if(index/96>=49)begin
                data<=16'b0000000000000000;
        end end
    end
endmodule
