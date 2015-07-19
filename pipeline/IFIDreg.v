`timescale 1ns/1ps

module IFIDreg(clk,datahazard,instructionin,PCplusin,instructionout,PCplusout);

input clk;
input datahazard;
input [31:0] instructionin;
input [31:0] PCplusin;
output [31:0] instructionout;
output [31:0] PCplusout;

reg [31:0] instruction = 32'h0;
reg [31:0] PCplus;

always @(posedge clk)
begin
  if(~datahazard)
  begin
      instruction <= instructionin;
      PCplus <= PCplusin;
  end
  else;
end

assign instructionout = instruction;
assign PCplusout = PCplus;

endmodule
