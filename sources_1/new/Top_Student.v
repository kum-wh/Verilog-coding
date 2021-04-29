`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//  LAB SESSION DAY : THURSDAY A.M.
//
//  STUDENT A NAME:
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: Kum Wing Ho
//  STUDENT B MATRICULATION NUMBER: A0217689L
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student(input CLOCK, btnC, btnU, btnR, btnL, btnD, [15:0] sw, 
    output [6:0] JC,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output [15:0]led,
    output [3:0]an,
    output [7:0]seg);
    wire [15:0]tester;
    wire [11:0]sample;
    top_audio a1(CLOCK, sw , J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, led, tester, an, seg, sample);
    Display fa0(CLOCK, sample, tester, btnC, btnU, btnR, btnL, btnD, sw, JC);
endmodule