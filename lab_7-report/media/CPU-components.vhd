architecture Behavioral of CPU is
    component RegisterFile port(
        clk   : in std_logic; 
        clear : in std_logic;
        
        write_addr : in std_logic_vector( 3 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        load       : in std_logic;                    
        
        read_addr1 : in std_logic_vector( 3 downto 0);
        read_addr2 : in std_logic_vector( 3 downto 0);
        
        read_data1 : out std_logic_vector(15 downto 0);
        read_data2 : out std_logic_vector(15 downto 0)
    );
    end component;

    component ALU16Bit port(    
        s : in std_logic_vector( 1 downto 0);
        a : in std_logic_vector(15 downto 0);
        b : in std_logic_vector(15 downto 0);
        sout : out std_logic_vector(15 downto 0);
        cout : out std_logic
    );
    end component;
...
begin
...
end Behavioral;
