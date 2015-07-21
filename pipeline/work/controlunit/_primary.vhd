library verilog;
use verilog.vl_types.all;
entity controlunit is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        IRQ             : in     vl_logic;
        PChigh          : in     vl_logic;
        PCplusin        : in     vl_logic_vector(31 downto 0);
        PCplusout       : out    vl_logic_vector(31 downto 0);
        PCSrc           : out    vl_logic_vector(2 downto 0);
        RegDst          : out    vl_logic_vector(1 downto 0);
        RegWr           : out    vl_logic;
        ALUSrc1         : out    vl_logic;
        ALUSrc2         : out    vl_logic;
        ALUFun          : out    vl_logic_vector(5 downto 0);
        Sign            : out    vl_logic;
        MemWr           : out    vl_logic;
        MemRd           : out    vl_logic;
        MemtoReg        : out    vl_logic_vector(1 downto 0);
        EXTOp           : out    vl_logic;
        LUOp            : out    vl_logic;
        JT              : out    vl_logic_vector(25 downto 0);
        OpCode          : out    vl_logic_vector(5 downto 0)
    );
end controlunit;
