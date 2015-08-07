library verilog;
use verilog.vl_types.all;
entity sampler is
    generic(
        SAMPLE_RATIO    : integer := 16
    );
    port(
        sample_sig      : out    vl_logic;
        din             : in     vl_logic;
        sample_clk      : in     vl_logic
    );
end sampler;
