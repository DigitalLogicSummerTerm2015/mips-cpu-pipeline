`timescale 1ns/1ps

module programcounter(clk,reset,PCSrc,ALUOut,ConBA,JT,DatabusA,PC,PCplusout);

input clk;
input reset;
input [2:0] PCSrc;
input ALUOut;
input [31:0] ConBA;
input [25:0] JT;
input [31:0] DatabusA;
output [31:0] PC;
output [31:0] PCplusout;

reg [31:0] currentPC;
wire [31:0] PCplusin = 32'h0;

always @(posedge clk or negedge reset)
begin
  if(~reset) currentPC <=32'h80000000;
  else
  begin
    case(PCSrc[2:0])
      3'b000: currentPC <= PCplusin;
      3'b001: currentPC <= (ALUOut == 1'b0) ? PCplusin : ConBA;
      3'b010: currentPC <= {currentPC[31],5'h00,JT};
      3'b011: currentPC <= DatabusA;
      3'b100: currentPC <= 32'h80000004;
      default: currentPC <= 32'h80000008;
    endcase
  end
end

assign PC = currentPC;
assign PCplusout = {PC[31],PC[30:0] + 31'h00000004};
assign PCplusin = PCplusout;
 
endmodule