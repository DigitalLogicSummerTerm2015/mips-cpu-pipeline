library verilog;
use verilog.vl_types.all;
entity comparer is
    port(
        dout            : out    vl_logic_vector(31 downto 0);
        Z               : in     vl_logic;
        V               : in     vl_logic;
        N               : in     vl_logic;
        ctrl            : in     vl_logic_vector(3 downto 1)
    );
end comparer;
