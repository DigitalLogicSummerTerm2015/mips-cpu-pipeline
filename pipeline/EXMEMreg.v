`timescale 1ns/1ps

module EXMEMreg(clk,instructionin,PCplusin,ALUresultin,DatabusBin,RegDstin,RegWrin,MemWrin,MemRdin,MemtoRegin,
instructionout,PCplusout,ALUresultout,DatabusBout,RegDstout,RegWrout,MemWrout,MemRdout,MemtoRegout);

input clk;
input [31:0] instructionin;
input [31:0] PCplusin;
input [31:0] ALUresultin;
input [31:0] DatabusBin;
input [1:0] RegDstin;
input RegWrin;
input MemWrin;
input MemRdin;
input [1:0] MemtoRegin;
output [31:0] instructionout;
reg [31:0] instructionout;
output [31:0] PCplusout;
reg [31:0] PCplusout;
output [31:0] ALUresultout;
reg [31:0] ALUresultout;
output [31:0] DatabusBout;
reg [31:0] DatabusBout;
output [1:0] RegDstout;
reg [1:0] RegDstout;
output RegWrout;
reg RegWrout;
output MemWrout;
reg MemWrout;
output MemRdout;
reg MemRdout;
output [1:0] MemtoRegout;
reg [1:0] MemtoRegout;

always @(posedge clk)
begin
  instructionout <= instructionin;
  PCplusout <= PCplusin;
  ALUresultout <= ALUresultin;
  DatabusBout <= DatabusBin;
  RegDstout <= RegDstin;
  RegWrout <= RegWrin;
  MemWrout <= MemWrin;
  MemRdout <= MemRdin;
  MemtoRegout <= MemtoRegin;
end

endmodule