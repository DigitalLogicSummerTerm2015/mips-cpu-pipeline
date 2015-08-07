library verilog;
use verilog.vl_types.all;
entity ROM is
    port(
        addr            : in     vl_logic_vector(31 downto 0);
        data            : out    vl_logic_vector(31 downto 0)
    );
end ROM;
