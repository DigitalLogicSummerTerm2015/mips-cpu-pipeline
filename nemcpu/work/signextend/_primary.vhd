library verilog;
use verilog.vl_types.all;
entity signextend is
    port(
        imm             : in     vl_logic_vector(15 downto 0);
        PCplus          : in     vl_logic_vector(31 downto 0);
        EXTOp           : in     vl_logic;
        LUOp            : in     vl_logic;
        ConBA           : out    vl_logic_vector(31 downto 0);
        immout          : out    vl_logic_vector(31 downto 0)
    );
end signextend;
