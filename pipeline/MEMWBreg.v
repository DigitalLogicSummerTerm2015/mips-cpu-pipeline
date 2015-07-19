`timescale 1ns/1ps

module MEMWBreg(clk,instructionin,rdatain,ALUresultin,RegDstin,RegWrin,MemtoRegin,
instructionout,rdataout,ALUresultout,RegDstout,RegWrout,MemtoRegout);

input clk;
input [31:0] instructionin;
input [31:0] rdatain;
input [31:0] ALUresultin;
input [1:0] RegDstin;
input RegWrin;
input [1:0] MemtoRegin;
output [31:0] instructionout;
reg [31:0] instructionout;
output [31:0] rdataout;
reg [31:0] rdataout;
output [31:0] ALUresultout;
reg [31:0] ALUresultout;
output [1:0] RegDstout;
reg [1:0] RegDstout;
output RegWrout;
reg RegWrout;
output [1:0] MemtoRegout;
reg [1:0] MemtoRegout;

always @(posedge clk)
begin
  instructionout <= instructionin;
  rdataout <= rdatain;
  ALUresultout <= ALUresultin;
  RegDstout <= RegDstin;
  RegWrout <= RegWrin;
  MemtoRegout <= MemtoRegin;
end

endmodule
