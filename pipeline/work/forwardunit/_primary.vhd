library verilog;
use verilog.vl_types.all;
entity forwardunit is
    port(
        IDEXRs          : in     vl_logic;
        IDEXRt          : in     vl_logic;
        EXMEMRd         : in     vl_logic;
        MEMWBRd         : in     vl_logic;
        EXMEMRegWr      : in     vl_logic;
        MEMWBRegWr      : in     vl_logic;
        forwardA        : out    vl_logic_vector(1 downto 0);
        forwardB        : out    vl_logic_vector(1 downto 0)
    );
end forwardunit;
