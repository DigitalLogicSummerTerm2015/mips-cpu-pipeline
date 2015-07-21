library verilog;
use verilog.vl_types.all;
entity shifter is
    port(
        dout            : out    vl_logic_vector(31 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ctrl            : in     vl_logic_vector(1 downto 0)
    );
end shifter;