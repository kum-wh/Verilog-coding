`timescale 1ns / 1ps

module switch(input CLOCK, input full, input [15:0] sw, output index);
    reg [6:0]C = 7'b0;
    assign index = (full==0)?0:(C==7'b1111111)?1:0;
    always @(posedge CLOCK) begin
    C[0]<=(sw[1]==1)?1:C[0];
    C[1]<=(sw[6]==1)?1:C[1];
    C[2]<=(sw[7]==1)?1:C[2];
    C[3]<=(sw[8]==1)?1:C[3];
    C[4]<=(sw[9]==1)?1:C[4];
    C[5]<=(sw[11]==1)?1:C[5];
    C[6]<=(sw[13]==1)?1:C[6];    
    end
endmodule
