`timescale 1ns/1ps

module IFIDreg(clk,PCSrc,IRQin,datahazard,instructionin,PCplusin,instructionout,PCplusout,IRQout);

input clk;
input [2:0] PCSrc;
input IRQin;
input datahazard;
input [31:0] instructionin;
input [31:0] PCplusin;
output [31:0] instructionout;
output [31:0] PCplusout;
output IRQout;

reg [31:0] instruction;
reg [31:0] PCplus;
reg IRQ;

always @(posedge clk)
begin
  if(PCSrc == 3'b000)
  begin
    if(~datahazard)
    begin
      instruction <= instructionin;
      PCplus <= PCplusin;
      IRQ <= IRQin;
    end
    else;
  end
  else
  begin
    instruction <= 32'h0;
    PCplus <= PCplusin;
    IRQ <= 1'b0;
  end
end

assign instructionout = instruction;
assign PCplusout = PCplus;
assign IRQout =  IRQ;

endmodule
