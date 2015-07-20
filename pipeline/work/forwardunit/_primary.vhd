library verilog;
use verilog.vl_types.all;
entity forwardunit is
    port(
        IFIDRs          : in     vl_logic_vector(4 downto 0);
        IFIDRt          : in     vl_logic_vector(4 downto 0);
        IDEXRs          : in     vl_logic_vector(4 downto 0);
        IDEXRt          : in     vl_logic_vector(4 downto 0);
        IDEXRd          : in     vl_logic_vector(4 downto 0);
        EXMEMRd         : in     vl_logic_vector(4 downto 0);
        MEMWBRd         : in     vl_logic_vector(4 downto 0);
        IDEXRegWr       : in     vl_logic;
        EXMEMRegWr      : in     vl_logic;
        MEMWBRegWr      : in     vl_logic;
        forwardA        : out    vl_logic_vector(1 downto 0);
        forwardB        : out    vl_logic_vector(1 downto 0);
        forward1        : out    vl_logic_vector(1 downto 0);
        forward2        : out    vl_logic_vector(1 downto 0)
    );
end forwardunit;
