library verilog;
use verilog.vl_types.all;
entity pipelineCPU is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        din             : in     vl_logic;
        switch          : in     vl_logic_vector(7 downto 0);
        led             : out    vl_logic_vector(7 downto 0);
        digi            : out    vl_logic_vector(11 downto 0);
        dout            : out    vl_logic
    );
end pipelineCPU;
