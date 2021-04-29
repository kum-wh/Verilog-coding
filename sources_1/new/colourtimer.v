`timescale 1ns / 1ps

module colourtimer(input clock, output [15:0] data );
    reg [1:0] COUNT = 2'b0;
    reg [24:0] COUNT2 = 25'b0;
    reg timer;
    assign data = (COUNT==2'b00)?16'b1111111111111111:
                  (COUNT==2'b01)?16'b0000000000011111:
                  (COUNT==2'b10)?16'b1111100000000000:
                  (COUNT==2'b11)?16'b0000011111100000:0;
                  
    always @ (posedge clock) begin
        COUNT2 <= COUNT2 + 1;
        timer <= (COUNT2==25'b0)?~timer:timer;
    end
    always @ (posedge timer) begin
        COUNT <= COUNT + 1;
    end
endmodule
