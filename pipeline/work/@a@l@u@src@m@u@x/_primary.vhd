library verilog;
use verilog.vl_types.all;
entity ALUSrcMUX is
    port(
        ALUSrc          : in     vl_logic;
        datain          : in     vl_logic_vector(31 downto 0);
        num             : in     vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0)
    );
end ALUSrcMUX;
