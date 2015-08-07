library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        Z               : out    vl_logic;
        V               : out    vl_logic;
        N               : out    vl_logic;
        dout            : out    vl_logic_vector(31 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ctrl            : in     vl_logic;
        Sign            : in     vl_logic
    );
end adder;
