library verilog;
use verilog.vl_types.all;
entity cache_D is
    port(
        clock           : in     vl_logic;
        write           : in     vl_logic;
        state           : in     vl_logic_vector(1 downto 0);
        owner           : in     vl_logic_vector(1 downto 0);
        address         : in     vl_logic_vector(2 downto 0);
        data_in         : in     vl_logic_vector(3 downto 0);
        current_state   : out    vl_logic_vector(1 downto 0);
        current_owner   : out    vl_logic_vector(1 downto 0);
        current_address : out    vl_logic_vector(2 downto 0);
        current_data    : out    vl_logic_vector(3 downto 0)
    );
end cache_D;
