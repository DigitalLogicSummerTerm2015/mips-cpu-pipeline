library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        ALUFun          : in     vl_logic_vector(5 downto 0);
        Sign            : in     vl_logic;
        Z               : out    vl_logic_vector(31 downto 0)
    );
end alu;
