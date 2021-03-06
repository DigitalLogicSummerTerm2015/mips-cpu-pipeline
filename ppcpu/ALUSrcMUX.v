`timescale 1ns/1ps

module ALUSrcMUX(ALUSrc,datain,num,dataout);

input ALUSrc;
input [31:0] datain;
input [31:0] num;
output [31:0] dataout;

assign dataout = (ALUSrc == 0) ? datain : num;

endmodule
