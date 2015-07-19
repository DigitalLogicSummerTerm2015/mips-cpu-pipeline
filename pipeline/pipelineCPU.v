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
wire [31:0] instructionout1;
wire IRQ;
wire [1:0] RegDst;
wire RegWr;
wire RegWrMEMWB;
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
wire [31:0] immout;
wire IDEXMenRd;
wire flushIDEX;
wire [1:0] RegDstn;
wire RegWrn;
wire ALUSrc1n;
wire ALUSrc2n;
wire [5:0] ALUFunn;
wire Signn;
wire MemWrn;
wire MemRdn;
wire [1:0] MemtoRegn;

programcounter PC1(clk,reset,datahazard,PCSrc,ALUOut,ConBA,JT,DatabusA,PC,PCplusin);

ROM rom1(PC,instructionin);

IFIDreg IFIDreg1(clk,datahazard,instructionin,PCplusin,instructionout,PCplusout);

controlunit ctrl1(instructionout,IRQ,PCplusout,PCplusout1,PCSrc,RegDst,RegWr,ALUSrc1,ALUSrc2,ALUFun,Sign,MemWr,MemRd,MemtoReg,EXTOp,LUOp,JT,OpCode);

RegFile regfile1(reset,clk,instructionout[25:21],DatabusA,instructionout[20:16],DatabusB,RegWrMEMWB,WriteReg,WriteData);

branchcheck bc1(OpCode,DatabusA,DatabusB,ALUOut);

signextend signextend1(instructionout[15:0],PCplusout,EXTOp,LUOp,ConBA,immout);

hazardcheck hc1(instructionout[25:21],instructionout[20:16],instructionout1[20:16],IDEXMemRd,datahazard,flushIDEX);

flushMUX fMUX1(flushIDEX,RegDst,RegWr,ALUSrc1,ALUSrc2,ALUFun,Sign,MemWr,MemRd,MemtoReg,RegDstn,RegWrn,ALUSrc1n,ALUSrc2n,ALUFunn,Signn,MemWrn,MemRdn,MemtoRegn);

endmodule
