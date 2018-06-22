library verilog;
use verilog.vl_types.all;
entity sm_cblock is
    port(
        clock           : in     vl_logic;
        write           : in     vl_logic;
        miss            : in     vl_logic;
        fetch           : in     vl_logic;
        invalidateIn    : in     vl_logic;
        writeMiss       : out    vl_logic;
        readMiss        : out    vl_logic;
        writeBack       : out    vl_logic;
        invalidateOut   : out    vl_logic;
        currentState    : out    vl_logic_vector(1 downto 0)
    );
end sm_cblock;
