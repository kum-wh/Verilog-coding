`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2021 11:31:17
// Design Name: 
// Module Name: assignment1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module assignment1(
    output LED1,
    output LED2,
    output LED3,
    output LED4,
    output LED5,
    output LED6,
    output LED7,
    output LED8,
    output LED9,
    output LED10,
    input SW1,
    input SW2,
    input SW3,
    input SW4,
    input SW5,
    input SW6,
    input SW7,
    input SW8,
    input SW9,
    input SW10,
    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output SEG0,
    output SEG1,
    output SEG2,
    output SEG3,
    output SEG4,
    output SEG5,
    output SEG6,
    output DP
    );
    assign LED1 = SW1;
    assign LED2 = SW2;
    assign LED3 = SW3;
    assign LED4 = SW4;
    assign LED5 = SW5;
    assign LED6 = SW6;
    assign LED7 = SW7;
    assign LED8 = SW8;
    assign LED9 = SW9;
    assign LED10 = SW10;
    assign AN2 = ~SW2 | ~SW8 | ~SW9 | ~SW10 | SW1 | SW3 | SW4 | SW5 | SW6 | ~SW7;
    assign AN1 = ~SW2 | ~SW8 | ~SW9 | ~SW10 | SW1 | SW3 | SW4 | SW5 | SW6 | ~SW7;
    assign SEG3 = ~SW2 | ~SW8 | ~SW9 | ~SW10 | SW1 | SW3 | SW4 | SW5 | SW6 | ~SW7;
    assign SEG4 = ~SW2 | ~SW8 | ~SW9 | ~SW10 | SW1 | SW3 | SW4 | SW5 | SW6 | ~SW7;
    assign SEG5 = ~SW2 | ~SW8 | ~SW9 | ~SW10 | SW1 | SW3 | SW4 | SW5 | SW6 | ~SW7;

endmodule
