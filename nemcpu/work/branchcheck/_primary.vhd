library verilog;
use verilog.vl_types.all;
entity branchcheck is
    port(
        OpCode          : in     vl_logic_vector(5 downto 0);
        DatabusA        : in     vl_logic_vector(31 downto 0);
        DatabusB        : in     vl_logic_vector(31 downto 0);
        branch          : out    vl_logic
    );
end branchcheck;
