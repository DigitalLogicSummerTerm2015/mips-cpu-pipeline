library verilog;
use verilog.vl_types.all;
entity IFIDreg is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        flush           : in     vl_logic;
        datahazard      : in     vl_logic;
        instructionin   : in     vl_logic_vector(31 downto 0);
        PCplusin        : in     vl_logic_vector(31 downto 0);
        instructionout  : out    vl_logic_vector(31 downto 0);
        PCplusout       : out    vl_logic_vector(31 downto 0)
    );
end IFIDreg;
