library verilog;
use verilog.vl_types.all;
entity fix_shifter is
    generic(
        SHIFT_AMOUNT    : integer := 1
    );
    port(
        dout            : out    vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ctrl            : in     vl_logic_vector(1 downto 0);
        enable          : in     vl_logic
    );
end fix_shifter;
