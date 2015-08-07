library verilog;
use verilog.vl_types.all;
entity serial_transceiver is
    generic(
        BAUD_RATE       : integer := 9600;
        SAMPLE_RATIO    : integer := 16;
        CLK_FREQUENCY   : integer := 100000000;
        LED_SCAN_RATE   : integer := 1000
    );
    port(
        dout            : out    vl_logic;
        a               : out    vl_logic_vector(7 downto 0);
        b               : out    vl_logic_vector(7 downto 0);
        ready           : out    vl_logic;
        din             : in     vl_logic;
        result          : in     vl_logic_vector(7 downto 0);
        tx_en           : in     vl_logic;
        clk             : in     vl_logic;
        reset_n         : in     vl_logic
    );
end serial_transceiver;
