library verilog;
use verilog.vl_types.all;
entity watchmaker is
    generic(
        RATIO           : integer := 100000000
    );
    port(
        new_clk         : out    vl_logic;
        clk             : in     vl_logic
    );
end watchmaker;
