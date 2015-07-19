`timescale 1ns/1ps

module forwardunit(IDEXRs,IDEXRt,EXMEMRd,MEMWBRd,EXMEMRegWr,MEMWBRegWr,forwardA,forwardB);

input IDEXRs;
input IDEXRt;
input EXMEMRd;
input MEMWBRd;
input EXMEMRegWr;
input MEMWBRegWr;
output [1:0] forwardA;
reg [1:0] forwardA;
output [1:0] forwardB;
reg [1:0] forwardB;

always @(*)
begin
  if(EXMEMRegWr)
  begin
    if(EXMEMRd)
    begin
      if(EXMEMRd == IDEXRs) forwardA <= 2'b10;
      else forwardA <= 2'b00;
      if(EXMEMRd == IDEXRt) forwardB <= 2'b10;
      else forwardB <= 2'b00;
    end
    else
    begin
      forwardA <= 2'b00;
      forwardB <= 2'b00;
    end
  end
  else
  begin
    forwardA <= 2'b00;
    forwardB <= 2'b00;
  end
  if(MEMWBRegWr)
  begin
    if(MEMWBRd)
    begin
      if(EXMEMRd == IDEXRs) forwardA <= 2'b00;
      else
      begin
        if(MEMWBRd == IDEXRs) forwardA <= 2'b01;
        else forwardA <= 2'b00;
      end
      if(EXMEMRd == IDEXRt) forwardB <= 2'b00;
      else
      begin
        if(MEMWBRd == IDEXRt) forwardB <= 2'b01;
        else forwardB <= 2'b00;
      end
    end
    else
    begin
      forwardA <= 2'b00;
      forwardB <= 2'b00;
    end
  end
  else
  begin
    forwardA <= 2'b00;
    forwardB <= 2'b00;
  end
end

endmodule
