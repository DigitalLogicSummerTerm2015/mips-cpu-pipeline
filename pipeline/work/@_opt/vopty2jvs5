library verilog;
use verilog.vl_types.all;
entity MEMWBreg is
    port(
        clk             : in     vl_logic;
        instructionin   : in     vl_logic_vector(31 downto 0);
        PCplusin        : in     vl_logic_vector(31 downto 0);
        rdatain         : in     vl_logic_vector(31 downto 0);
        ALUresultin     : in     vl_logic_vector(31 downto 0);
        RegDstin        : in     vl_logic_vector(1 downto 0);
        RegWrin         : in     vl_logic;
        MemtoRegin      : in     vl_logic_vector(1 downto 0);
        instructionout  : out    vl_logic_vector(31 downto 0);
        PCplusout       : out    vl_logic_vector(31 downto 0);
        rdataout        : out    vl_logic_vector(31 downto 0);
        ALUresultout    : out    vl_logic_vector(31 downto 0);
        RegDstout       : out    vl_logic_vector(1 downto 0);
        RegWrout        : out    vl_logic;
        MemtoRegout     : out    vl_logic_vector(1 downto 0)
    );
end MEMWBreg;
