library verilog;
use verilog.vl_types.all;
entity maindec is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        beq             : out    vl_logic;
        bne             : out    vl_logic;
        bge             : out    vl_logic;
        bl              : out    vl_logic;
        jr              : out    vl_logic;
        alusrca         : out    vl_logic;
        alusrcb         : out    vl_logic;
        s               : out    vl_logic;
        regwrite        : out    vl_logic;
        regdst          : out    vl_logic_vector(1 downto 0);
        memsign         : out    vl_logic;
        memwrite        : out    vl_logic_vector(1 downto 0);
        jump            : out    vl_logic;
        regvalue        : out    vl_logic_vector(2 downto 0);
        undefined       : out    vl_logic;
        aluop           : out    vl_logic_vector(3 downto 0)
    );
end maindec;
