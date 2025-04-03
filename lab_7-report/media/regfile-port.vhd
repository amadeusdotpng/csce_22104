Entity RegisterFile is
    port(
        clk    : in std_logic; -- positive edge triggered clock
        clear  : in std_logic; -- asynchronous, active low reset
        
        a_addr : in std_logic_vector( 3 downto 0); -- register select for input a
        a_data : in std_logic_vector(15 downto 0); -- input data port
        load   : in std_logic;                     -- load enable/enable signal for "loading"
        
        b_addr : in std_logic_vector(3 downto 0); -- register select for output b
        c_addr : in std_logic_vector(3 downto 0); -- register select for output c
        
        b_data : out std_logic_vector(15 downto 0); -- first output data port
        c_data : out std_logic_vector(15 downto 0)  -- second output data port
    );
End RegisterFile;
