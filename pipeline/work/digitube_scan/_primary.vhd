library verilog;
use verilog.vl_types.all;
entity digitube_scan is
    port(
        digi_in         : in     vl_logic_vector(11 downto 0);
        digi_out1       : out    vl_logic_vector(6 downto 0);
        digi_out2       : out    vl_logic_vector(6 downto 0);
        digi_out3       : out    vl_logic_vector(6 downto 0);
        digi_out4       : out    vl_logic_vector(6 downto 0)
    );
end digitube_scan;
