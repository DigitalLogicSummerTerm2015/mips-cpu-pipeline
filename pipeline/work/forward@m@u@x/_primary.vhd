library verilog;
use verilog.vl_types.all;
entity forwardMUX is
    port(
        forward         : in     vl_logic_vector(1 downto 0);
        Databus         : in     vl_logic_vector(31 downto 0);
        writedata       : in     vl_logic_vector(31 downto 0);
        ALUresult       : in     vl_logic_vector(31 downto 0);
        data            : out    vl_logic_vector(31 downto 0)
    );
end forwardMUX;
