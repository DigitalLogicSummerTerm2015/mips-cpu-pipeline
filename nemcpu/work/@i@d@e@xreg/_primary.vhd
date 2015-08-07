library verilog;
use verilog.vl_types.all;
entity IDEXreg is
    port(
        clk             : in     vl_logic;
        instructionin   : in     vl_logic_vector(31 downto 0);
        datahazard      : in     vl_logic;
        DatabusAin      : in     vl_logic_vector(31 downto 0);
        DatabusBin      : in     vl_logic_vector(31 downto 0);
        immin           : in     vl_logic_vector(31 downto 0);
        PCplusin        : in     vl_logic_vector(31 downto 0);
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
        MemtoRegout     : out    vl_logic_vector(1 downto 0);
        shamt           : out    vl_logic_vector(4 downto 0);
        Rsout           : out    vl_logic_vector(4 downto 0);
        Rtout           : out    vl_logic_vector(4 downto 0);
        Rdout           : out    vl_logic_vector(4 downto 0);
        DatabusAout     : out    vl_logic_vector(31 downto 0);
        DatabusBout     : out    vl_logic_vector(31 downto 0);
        immout          : out    vl_logic_vector(31 downto 0);
        PCplusout       : out    vl_logic_vector(31 downto 0)
    );
end IDEXreg;
