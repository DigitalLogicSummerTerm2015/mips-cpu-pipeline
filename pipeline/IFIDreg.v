`timescale 1ns/1ps

module IFIDreg(clk,reset,flush,datahazard,instructionin,PCplusin,instructionout,PCplusout);

input clk;
input reset;
input flush;
input datahazard;
input [31:0] instructionin;
input [31:0] PCplusin;
output [31:0] instructionout;
output [31:0] PCplusout;

reg [31:0] instruction = 32'h0;
reg [31:0] PCplus = 32'h0;

always @(posedge clk or negedge reset)
begin
  if(~reset)
  begin
    instruction <= 32'h0;
    PCplus <= 32'h0;
  end
  else
  begin
    if(~datahazard)
    begin
      if(flush)
      begin
        instruction <= 32'h0;
        PCplus <= PCplusin;
      end
      else
      begin
        instruction <= instructionin;
        PCplus <= PCplusin;
      end
    end
    else;
  end
end

assign instructionout = instruction;
assign PCplusout = PCplus;

endmodule
