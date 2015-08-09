library verilog;
use verilog.vl_types.all;
entity Peripheral is
    port(
        reset           : in     vl_logic;
        pclk            : in     vl_logic;
        clk             : in     vl_logic;
        rd              : in     vl_logic;
        wr              : in     vl_logic;
        addr            : in     vl_logic_vector(31 downto 0);
        wdata           : in     vl_logic_vector(31 downto 0);
        rdata           : out    vl_logic_vector(31 downto 0);
        led             : out    vl_logic_vector(7 downto 0);
        switch          : in     vl_logic_vector(7 downto 0);
        digi            : out    vl_logic_vector(11 downto 0);
        irqout          : out    vl_logic;
        din             : in     vl_logic;
        dout            : out    vl_logic
    );
end Peripheral;
