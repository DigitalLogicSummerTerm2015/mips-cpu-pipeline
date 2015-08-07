library verilog;
use verilog.vl_types.all;
entity DataMem is
    generic(
        RAM_SIZE        : integer := 32
    );
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        rdata           : out    vl_logic_vector(31 downto 0)
    );
end DataMem;
