library verilog;
use verilog.vl_types.all;
entity databusMUX is
    port(
        forward         : in     vl_logic_vector(1 downto 0);
        databus         : in     vl_logic_vector(31 downto 0);
        ALUresult       : in     vl_logic_vector(31 downto 0);
        Memaddr         : in     vl_logic_vector(31 downto 0);
        writedata       : in     vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0)
    );
end databusMUX;
