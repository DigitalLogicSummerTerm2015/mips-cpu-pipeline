library verilog;
use verilog.vl_types.all;
entity RegDstMUX is
    port(
        RegDst          : in     vl_logic_vector(1 downto 0);
        Rd              : in     vl_logic_vector(4 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        writereg        : out    vl_logic_vector(4 downto 0)
    );
end RegDstMUX;
