`timescale 1ns/1ps

module hazardcheck(IFIDRs,IFIDRt,IDEXRt,IDEXMemRd,datahazard,flushIDEX);

input [4:0] IFIDRs;
input [4:0] IFIDRt;
input [4:0] IDEXRt;
input IDEXMemRd;
output datahazard;
reg datahazard;
output flushIDEX;
reg flushIDEX;

always @(*)
begin
  if(IDEXMemRd)
  begin
    if(IDEXRt == IFIDRs || IDEXRt == IFIDRt)
    begin
      datahazard <= 1;
      flushIDEX <= 1;
    end
    else
    begin
      datahazard <= 0;
      flushIDEX <= 0;
    end
  end
  else
  begin
    datahazard <= 0;
    flushIDEX <= 0;
  end
end


endmodule
