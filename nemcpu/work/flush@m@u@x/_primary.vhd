library verilog;
use verilog.vl_types.all;
entity flushMUX is
    port(
        flushIDEX       : in     vl_logic;
        RegDstin        : in     vl_logic_vector(1 downto 0);
        RegWrin         : in     vl_logic;
        ALUSrc1in       : in     vl_logic;
        ALUSrc2in       : in     vl_logic;
        ALUFunin        : in     vl_logic_vector(5 downto 0);
        Signin          : in     vl_logic;
        MemWrin         : in     vl_logic;
        MemRdin         : in     vl_logic;
        MemtoRegin      : in     vl_logic_vector(1 downto 0);
        RegDstout       : out    vl_logic_vector(1 downto 0);
        RegWrout        : out    vl_logic;
        ALUSrc1out      : out    vl_logic;
        ALUSrc2out      : out    vl_logic;
        ALUFunout       : out    vl_logic_vector(5 downto 0);
        Signout         : out    vl_logic;
        MemWrout        : out    vl_logic;
        MemRdout        : out    vl_logic;
        MemtoRegout     : out    vl_logic_vector(1 downto 0)
    );
end flushMUX;
