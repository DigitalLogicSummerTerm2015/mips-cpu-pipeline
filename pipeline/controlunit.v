`timescale 1ns/1ps

module controlunit(instruction,IRQ,PCplusin,PCplusout,PCSrc,RegDst,RegWr,ALUSrc1,ALUSrc2,ALUFun,Sign,MemWr,MemRd,MemtoReg,EXTOp,LUOp,JT,OpCode);

input [31:0] instruction;
input [31:0] IRQ;
input [31:0] PCplusin;
output [31:0] PCplusout;
output [2:0] PCSrc;
reg [2:0] PCSrc;
output [1:0] RegDst;
reg [1:0] RegDst;
output RegWr;
reg RegWr;
output ALUSrc1;
reg ALUSrc1;
output ALUSrc2;
reg ALUSrc2;
output [5:0] ALUFun;
reg [5:0] ALUFun;
output Sign;
reg Sign;
output MemWr;
reg MemWr;
output MemRd;
reg MemRd;
output [1:0] MemtoReg;
reg [1:0] MemtoReg;
output EXTOp;
reg EXTOp;
output LUOp;
reg LUOp;
output [25:0] JT;
reg [25:0] JT = 26'h0;
output [5:0] OpCode;
reg [5:0] OpCode = 6'h00;

assign PCplusout = PCplusin;

always @(*)
begin
  if(~IRQ)
  begin
    case(instruction[31:26])
      6'h00://R instructions
      begin
        case(instruction[5:0])
          6'h00://sll
          begin
            if(instruction[25:21] == 5'h00)
            begin
              ALUFun <= 6'h20;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 1;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//undefined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;              
            end            
          end
          6'h02://srl
          begin
            if(instruction[25:21] == 5'h00)
            begin
              ALUFun <= 6'h21;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 1;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//undefined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;              
            end
          end            
          6'h03://sra
          begin
            if(instruction[25:21] == 5'h00)
            begin
              ALUFun <= 6'h23;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 1;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//undefined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;              
            end
          end
          6'h08://jr
          begin
            if(instruction[20:6] == 15'h0000)
            begin
              PCSrc <= 3'b011;
              RegWr <= 0;
              MemWr <= 0;
              MemRd <= 0;              
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;      
            end
          end            
          6'h09://jalr
          begin
            if(instruction[20:16] == 5'h00 && instruction[10:6] == 5'h00)
            begin
              PCSrc <= 3'b011;
              RegDst <= 2'b10;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;        
            end
            else
            begin//undefined instruction
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end
          6'h20://add
          begin
            if(instruction[10:6]==5'h00)      
            begin
              ALUFun <= 6'h00;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end        
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end         
          6'h21://addu
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h00;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end      
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end      
          end
          6'h22://sub
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h01;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end    
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end    
          end
          6'h23://subu
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h01;      
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end  
          end
          6'h24://and
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h18;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end
          6'h25://or
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h1e;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end
          6'h26://xor
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h16;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end
          6'h27://nor  
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h11;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end  
          6'h2a://slt
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h35;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end
          6'h2b://sltu
          begin
            if(instruction[10:6]==5'h00)
            begin
              ALUFun <= 6'h35;
              PCSrc <= 3'b000;
              RegDst <= 2'b00;
              RegWr <= 1;
              ALUSrc1 <= 0;
              ALUSrc2 <= 0;
              Sign <= 0;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b00;
            end
            else//underfined instruction
            begin
              PCSrc <= 3'b101;
              RegDst <= 2'b11;
              RegWr <= 1;
              MemWr <= 0;
              MemRd <= 0;
              MemtoReg <= 2'b10;
            end
          end
          default://underfined instruction
          begin
            PCSrc <= 3'b101;
            RegDst <= 2'b11;
            RegWr <= 1;
            MemWr <= 0;
            MemRd <= 0;
            MemtoReg <= 2'b10;
          end
        endcase
      end
      6'h01://bgez
      begin
        if(instruction[20:16]==5'h01)
        begin
          OpCode <= 6'h01;
          PCSrc <= 3'b001;
          RegWr <= 0;
          MemWr <= 0;
          MemRd <= 0;
          EXTOp <= 1;
          LUOp <= 0;
        end
        else//underfined instruction
        begin
          OpCode <= 6'h00;
          PCSrc <= 3'b101;
          RegDst <= 2'b11;
          RegWr <= 1;
          MemWr <= 0;
          MemRd <= 0;
          MemtoReg <= 2'b10;
        end
      end
      6'h02://j
      begin
        JT <= instruction[25:0];
        PCSrc <= 3'b010;
        RegWr <= 0;
        MemWr <= 0;
        MemRd <= 0;
      end
      6'h03://jal
      begin
        JT <= instruction[25:0];
        PCSrc <= 3'b010;
        RegDst <= 2'b10;
        RegWr <= 1;
        MemWr <= 0;
        MemRd <= 0;
        MemtoReg <= 2'b10;
      end
      6'h04://beq
      begin
        OpCode <= 6'h04;
        PCSrc <= 3'b001;
        RegWr <= 0;
        MemWr <= 0;
        MemRd <= 0;
        EXTOp <= 1;
        LUOp <= 0;
      end
      6'h05://bne
      begin
        OpCode <= 6'h05;
        PCSrc <= 3'b001;
        RegWr <= 0;
        MemWr <= 0;
        MemRd <= 0;
        EXTOp <= 1;
        LUOp <= 0;
      end
      6'h06://blez
      begin
        OpCode <= 6'h06;
        PCSrc <= 3'b001;
        RegWr <= 0;
        MemWr <= 0;
        MemRd <= 0;
        EXTOp <= 1;
        LUOp <= 0;
      end
      6'h07://bgtz
      begin
        OpCode <= 6'h07;
        PCSrc <= 3'b001;
        RegWr <= 0;
        MemWr <= 0;
        MemRd <= 0;
        EXTOp <= 1;
        LUOp <= 0;
      end
      6'h08://addi
      begin
        ALUFun <= 6'h00;
        PCSrc <= 3'b000;
        RegDst <= 2'b01;
        RegWr <= 1;
        ALUSrc1 <= 0;
        ALUSrc2 <= 1;
        Sign <= 1;
        MemWr <= 0;
        MemRd <= 0;
        MemtoReg <= 2'b00;
        EXTOp <= 1;
        LUOp <= 0;
      end
      6'h09://addiu
      begin
        ALUFun <= 6'h00;
        PCSrc <= 3'b000;
        RegDst <= 2'b01;
        RegWr <= 1;
        ALUSrc1 <= 0;
        ALUSrc2 <= 1;
        Sign <= 1;
        MemWr <= 0;
        MemRd <= 0;
        MemtoReg <= 2'b00;
        EXTOp <= 1;
        LUOp <= 0; 
      end
      6'h0a://slti
      begin
        
ALUFun <= 6'h35;
        PCSrc <= 3'b000;
        RegDst <= 2'b01;
        RegWr <= 1;
        ALUSrc1 <= 0;
        ALUSrc2 <= 1;
        Sign <= 1;
        MemWr <= 0;
        MemRd <= 0;
        MemtoReg <= 2'b00;
        EXTOp <= 1;
        LUOp <= 0;
      end
      6'h0b://sltiu
      begin
        ALUFun <= 6'h35;
        PCSrc <= 3'b000;
        RegDst <= 2'b01;
        RegWr <= 1;
        ALUSrc1 <= 0;
        ALUSrc2 <= 1;
        Sign <= 0;
        MemWr <= 0;  
        MemRd <= 0;
        MemtoReg <= 2'b00;
        EXTOp <= 0;
        LUOp <= 0;
      end
      6'h0c://andi
      begin
        ALUFun <= 6'h18;
        PCSrc <= 3'b000;
        RegDst <= 2'b01;
        RegWr <= 1;
        ALUSrc1 <= 0;
        ALUSrc2 <= 1;
        Sign <= 1;
        MemWr <= 0;
        MemRd <= 0;
        MemtoReg <= 2'b00;
        EXTOp <= 1;
        LUOp <= 0;
      end
      6'h0f://lui
      begin
        if(instruction[25:21]==5'h00) 
        begin
          ALUFun <= 6'h00;
          PCSrc <= 3'b000;
          RegDst <= 2'b01;
          RegWr <= 1;
          ALUSrc1 <= 0;
          ALUSrc2 <= 1;
          Sign <= 0;
          MemWr <= 0;
          MemRd <= 0;
          MemtoReg <= 2'b00;
          LUOp <= 1;
        end
        else//undefined instruction
        begin
          PCSrc <= 3'b101;
          RegDst <= 2'b11;
          RegWr <= 1;
          MemWr <= 0;
          MemRd <= 0;
          MemtoReg <= 2'b10;
        end
      end
      6'h23://lw
      begin
        ALUFun <= 6'h00;
        PCSrc <= 3'b000;
        RegDst <= 2'b01;
        RegWr <= 1;
        ALUSrc1 <= 0;
        ALUSrc2 <= 1;
        Sign <= 1;
        MemWr <= 0;
        MemRd <= 1;
        MemtoReg <= 2'b01;
        EXTOp <= 1;
        LUOp <= 0; 
      end
      6'h2b://sw
      begin
        ALUFun <= 6'h00;
        PCSrc <= 3'b000;
        RegDst <= 2'b01;
        RegWr <= 0;
        ALUSrc1 <= 0;
        ALUSrc2 <= 1;
        Sign <= 1;
        MemWr <= 1;
        MemRd <= 0;
        EXTOp <= 1;
        LUOp <= 0;
      end
      default://undefined instruction
      begin
        PCSrc <= 3'b101;
        RegDst <= 2'b11;
        RegWr <= 1;
        MemWr <= 0;
        MemRd <= 0;
        MemtoReg <= 2'b10;
      end
    endcase
  end
  else//interrupted
  begin
    PCSrc <= 3'b100;
    RegDst <= 2'b11;
    RegWr <= 1;
    MemWr <= 0;
    MemRd <= 0;
    MemtoReg <= 2'b10;
  end
end

endmodule
