`timescale 1ns/1ps

module pipelineCPU(clk,reset,switch,led,digi);

input clk;
input reset;
input switch;
output led;
output digi;//input and output need modifying

wire datahazard;
wire [2:0] PCSrc;
wire ALUOut;
wire [31:0] ConBA;
wire [25:0] JT;
wire [31:0] DatabusA;
wire [31:0] DatabusB;
wire [31:0] daout;
wire [31:0] dbout;
wire [31:0] PC;
wire [31:0] PCplusin;
wire [31:0] PCplusout;
wire [31:0] PCplusout1;
wire [31:0] instructionin;
wire [31:0] instructionout;
wire IRQ;
wire IRQout;
wire [1:0] RegDst;
wire RegWr;
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
wire IDEXMemRd;
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
wire [1:0] IDEXRegDst;
wire [1:0] EXMEMRegDst;
wire [1:0] MEMWBRegDst;
wire IDEXRegWr;
wire IDEXALUSrc1;
wire IDEXALUSrc2;
wire [5:0] IDEXALUFun;
wire IDEXSign;
wire IDEXMemWr;
wire EXMEMMemWr;
wire EXMEMMemRd;
wire [1:0] IDEXMemtoReg;
wire [1:0] EXMEMMemtoReg;
wire [1:0] MEMWBMemtoReg;
wire [4:0] IDEXshamt;
wire [4:0] IDEXRs;
wire [4:0] IDEXRt;
wire [4:0] IDEXRd;
wire [31:0] DatabusAout;
wire [31:0] DatabusBout;
wire [31:0] imm;
wire [31:0] IDEXPCplus;
wire [31:0] EXMEMPCplus;
wire [31:0] MEMWBPCplus;
wire [4:0] EXMEMRt;
wire [4:0] EXMEMRd;
wire [4:0] MEMWBRt;
wire [4:0] MEMWBRd;
wire EXMEMRegWr;
wire MEMWBRegWr;
wire [1:0] forwardA;
wire [1:0] forwardB;
wire [1:0] forward1;
wire [1:0] forward2;
wire [31:0] EXMEMALUresult;
wire [31:0] MEMWBALUresult;
wire [31:0] DataA;
wire [31:0] DataB;
wire [31:0] DataAin;
wire [31:0] DataBin;
wire [31:0] ALUresult;
wire [31:0] EXMEMDatawrite;
wire [31:0] RAMrdata;
wire [31:0] RAMrdataout;

programcounter PC1(clk,reset,datahazard,PCSrc,ALUOut,ConBA,JT,DatabusA,PC,PCplusin);

ROM rom1(PC,instructionin);

IFIDreg IFIDreg1(clk,PCSrc,IRQ,datahazard,instructionin,PCplusin,instructionout,PCplusout,IRQout);

controlunit ctrl1(instructionout,IRQout,PCplusout,PCplusout1,PCSrc,RegDst,RegWr,ALUSrc1,ALUSrc2,ALUFun,Sign,MemWr,MemRd,MemtoReg,EXTOp,LUOp,JT,OpCode);

RegFile regfile1(reset,clk,instructionout[25:21],DatabusA,instructionout[20:16],DatabusB,MEMWBRegWr,WriteReg,WriteData);

branchcheck bc1(OpCode,daout,dbout,ALUOut);

signextend signextend1(instructionout[15:0],PCplusout,EXTOp,LUOp,ConBA,immout);

hazardcheck hc1(instructionout[25:21],instructionout[20:16],IDEXRt,EXMEMRt,IDEXMemRd,EXMEMMemRd,datahazard,flushIDEX);

flushMUX fMUX1(flushIDEX,RegDst,RegWr,ALUSrc1,ALUSrc2,ALUFun,Sign,MemWr,MemRd,MemtoReg,RegDstn,RegWrn,ALUSrc1n,ALUSrc2n,ALUFunn,Signn,MemWrn,MemRdn,MemtoRegn);

IDEXreg IDEXreg1(clk,instructionout,daout,dbout,immout,PCplusout1,RegDstn,RegWrn,ALUSrc1n,ALUSrc2n,ALUFunn,Signn,MemWrn,MemRdn,MemtoRegn,
IDEXRegDst,IDEXRegWr,IDEXALUSrc1,IDEXALUSrc2,IDEXALUFun,IDEXSign,IDEXMemWr,IDEXMemRd,IDEXMemtoReg,IDEXshamt,IDEXRs,IDEXRt,IDEXRd,DatabusAout,DatabusBout,imm,IDEXPCplus);

forwardunit fu1(instructionout[25:21],instructionout[20:16],IDEXRs,IDEXRt,IDEXRd,EXMEMRd,MEMWBRd,
IDEXRegWr,EXMEMRegWr,MEMWBRegWr,forwardA,forwardB,forward1,forward2);

databusMUX DA(forward1,DatabusA,ALUresult,EXMEMALUresult,WriteData,daout);

databusMUX DB(forward2,DatabusB,ALUresult,EXMEMALUresult,WriteData,dbout);

forwardMUX FA(forwardA,DatabusAout,WriteData,EXMEMALUresult,DataA);

forwardMUX FB(forwardB,DatabusBout,WriteData,EXMEMALUresult,DataB);

ALUSrcMUX ALA(IDEXALUSrc1,DataA,{27'h0,IDEXshamt},DataAin);

ALUSrcMUX ALB(IDEXALUSrc2,DataB,imm,DataBin);

ALU ALU1(DataAin,DataBin,IDEXALUFun,IDEXSign,ALUresult);//refer to the book

EXMEMreg EXMEMreg1(clk,IDEXRt,IDEXRd,IDEXPCplus,ALUresult,DataB,IDEXRegDst,IDEXRegWr,IDEXMemWr,IDEXMemRd,IDEXMemtoReg,
EXMEMRt,EXMEMRd,EXMEMPCplus,EXMEMALUresult,EXMEMDatawrite,EXMEMRegDst,EXMEMRegWr,EXMEMMemWr,EXMEMMemRd,EXMEMMemtoReg);

DataMem RAM1(reset,clk,EXMEMMemRd,EXMEMMemWr,EXMEMALUresult,EXMEMDatawrite,RAMrdata,led,switch,digi,IRQ);

MEMWBreg MEMWBreg1(clk,EXMEMRt,EXMEMRd,EXMEMPCplus,RAMrdata,EXMEMALUresult,EXMEMRegDst,EXMEMRegWr,EXMEMMemtoReg,
MEMWBRt,MEMWBRd,MEMWBPCplus,RAMrdataout,MEMWBALUresult,MEMWBRegDst,MEMWBRegWr,MEMWBMemtoReg);

MemtoRegMUX MtR(MEMWBMemtoReg,MEMWBALUresult,RAMrdataout,MEMWBPCplus,WriteData);

RegDstMUX RD(MEMWBRegDst,MEMWBRd,MEMWBRt,WriteReg);

endmodule
