library verilog;
use verilog.vl_types.all;
entity receiver is
    port(
        rx_data         : out    vl_logic_vector(7 downto 0);
        rx_status       : out    vl_logic;
        din             : in     vl_logic;
        clk             : in     vl_logic;
        sample_clk      : in     vl_logic
    );
end receiver;
