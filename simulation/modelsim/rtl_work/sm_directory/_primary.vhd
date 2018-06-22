library verilog;
use verilog.vl_types.all;
entity sm_directory is
    port(
        clock           : in     vl_logic;
        writeMiss       : in     vl_logic;
        readMiss        : in     vl_logic;
        writeBack       : in     vl_logic;
        invalidateIn    : in     vl_logic;
        fetch           : out    vl_logic;
        invalidateOut   : out    vl_logic;
        dataValueReply  : out    vl_logic;
        sharers         : out    vl_logic_vector(1 downto 0);
        currentState    : out    vl_logic_vector(1 downto 0)
    );
end sm_directory;
