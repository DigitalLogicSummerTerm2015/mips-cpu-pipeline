library verilog;
use verilog.vl_types.all;
entity programcounter is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        datahazard      : in     vl_logic;
        PCSrc           : in     vl_logic_vector(2 downto 0);
        ALUOut          : in     vl_logic;
        ConBA           : in     vl_logic_vector(31 downto 0);
        JT              : in     vl_logic_vector(25 downto 0);
        DatabusA        : in     vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        PCplusout       : out    vl_logic_vector(31 downto 0)
    );
end programcounter;
