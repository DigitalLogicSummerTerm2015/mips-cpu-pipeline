library verilog;
use verilog.vl_types.all;
entity sender is
    port(
        dout            : out    vl_logic;
        tx_status       : out    vl_logic;
        tx_data         : in     vl_logic_vector(7 downto 0);
        tx_en           : in     vl_logic;
        clk             : in     vl_logic;
        send_clk        : in     vl_logic
    );
end sender;
