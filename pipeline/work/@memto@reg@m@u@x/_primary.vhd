library verilog;
use verilog.vl_types.all;
entity MemtoRegMUX is
    port(
        MemtoReg        : in     vl_logic_vector(1 downto 0);
        ALUresult       : in     vl_logic_vector(31 downto 0);
        rdata           : in     vl_logic_vector(31 downto 0);
        PCplus          : in     vl_logic_vector(31 downto 0);
        writedata       : out    vl_logic
    );
end MemtoRegMUX;
