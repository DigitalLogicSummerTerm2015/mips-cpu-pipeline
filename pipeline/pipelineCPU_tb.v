`timescale 1ns/1ps

module testpipelineCPU();

wire switch;
wire led;
wire digi;

reg clk;
reg reset;
wire clkw;
wire resetw;

assign clkw = clk;
assign resetw = reset;

pipelineCPU CPU1(clkw,resetw,switch,led,digi);

initial
begin
  clk <= 1; 
  reset <= 1;
end

always #5 clk <= ~clk;

initial
begin
  #7 reset <= 0;
  #1 reset <= 1;
  #2000 $finish;
end

endmodule
