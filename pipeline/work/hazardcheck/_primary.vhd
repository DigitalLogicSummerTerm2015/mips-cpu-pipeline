library verilog;
use verilog.vl_types.all;
entity hazardcheck is
    port(
        IFIDRs          : in     vl_logic_vector(4 downto 0);
        IFIDRt          : in     vl_logic_vector(4 downto 0);
        IDEXRt          : in     vl_logic_vector(4 downto 0);
        IDEXMemRd       : in     vl_logic;
        datahazard      : out    vl_logic;
        flushIDEX       : out    vl_logic
    );
end hazardcheck;
