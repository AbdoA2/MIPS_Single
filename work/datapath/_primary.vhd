library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        alusrca         : in     vl_logic;
        alusrcb         : in     vl_logic;
        regdst          : in     vl_logic_vector(1 downto 0);
        regvalue        : in     vl_logic_vector(2 downto 0);
        aluop           : in     vl_logic_vector(3 downto 0);
        memsign         : in     vl_logic;
        regwrite        : in     vl_logic;
        s               : in     vl_logic;
        cause           : in     vl_logic;
        excep           : in     vl_logic;
        jr              : in     vl_logic;
        beq             : in     vl_logic;
        bne             : in     vl_logic;
        bge             : in     vl_logic;
        bl              : in     vl_logic;
        jump            : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        readdata        : in     vl_logic_vector(31 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        writedata       : out    vl_logic_vector(31 downto 0);
        \OF\            : out    vl_logic
    );
end datapath;
