`timescale 1ns/1ps

module pipelineCPU(clk,reset);

input clk;
input reset;

wire datahazard;
wire [2:0] PCSrc;
wire ALUOut;
wire [31:0] ConBA;
wire [25:0] JT;
wire [31:0] DatabusA;
wire [31:0] DatabusB;
wire [31:0] PC;
wire [31:0] PCplusin;
wire [31:0] PCplusout;
wire [31:0] PCplusout1;
wire [31:0] instructionin;
wire [31:0] instructionout;
wire IRQ;
wire [1:0] RegDst;
wire RegWr;
wire RegWr4;
wire ALUSrc1;
wire ALUSrc2;
wire [5:0] ALUFun;
wire Sign;
wire MemWr;
wire MemRd;
wire [1:0] MemtoReg;
wire EXTOp;
wire LUOp;
wire [5:0] OpCode;
wire [4:0] WriteReg;
wire [31:0] WriteData;

programcounter PC1(clk,reset,datahazard,PCSrc,ALUOut,ConBA,JT,DatabusA,PC,PCplusin);

ROM rom1(PC,instructionin);

IFIDreg IFIDreg1(clk,datahazard,instructionin,PCplusin,instructionout,PCplusout);

controlunit ctrl1(instructionout,IRQ,PCplusout,PCplusout1,PCSrc,RegDst,RegWr,ALUSrc1,ALUSrc2,ALUFun,Sign,MemWr,MemRd,MemtoReg,EXTOp,LUOp,JT,OpCode);

RegFile regfile1(reset,clk,instructionout[25:21],DatabusA,instructionout[20:16],DatabusB,RegWr4,WriteReg,WriteData);

branchcheck bc1(OpCode,DatabusA,DatabusB,ALUOut);

endmodule
