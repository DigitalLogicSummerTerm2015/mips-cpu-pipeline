`timescale 1ns/1ps

module branchcheck(OpCode,DatabusA,DatabusB,branch);

input [5:0] OpCode;
input [31:0] DatabusA;
input [31:0] DatabusB;
output branch;
reg branch;

always @(*)
begin
  case(OpCode)
    6'h00: branch <= 0;
    6'h01://bgez
    begin
      if(DatabusA[31] == 1'b1) branch <= 0;
      else branch <= 1;
    end
    6'h04://beq
    begin
      if(DatabusA == DatabusB) branch <= 1;
      else branch <= 0;
    end
    6'h05://bne
    begin
      if(DatabusA == DatabusB) branch <= 0;
      else branch <= 1;
    end
    6'h06://blez
    begin
      if(DatabusA[31] == 1'b1 || DatabusA == 32'h0) branch <= 1;
      else branch <= 0;
    end
    6'h07://bgtz
    begin
      if(DatabusA[31] == 1'b1 || DatabusA == 32'h0) branch <= 0;
      else branch <= 1;
    end
    default: branch <= 0;
  endcase
end

endmodule
