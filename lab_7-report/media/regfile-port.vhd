Entity RegFile is
    port(
        clk   : in std_logic;
        clear : in std_logic;
        
        write_addr : in std_logic_vector( 3 downto 0);
        write_data : in std_logic_vector(15 downto 0);
        load       : in std_logic;
        
        read_addr1 : in std_logic_vector(3 downto 0);
        read_addr2 : in std_logic_vector(3 downto 0);
        
        read_data1 : out std_logic_vector(15 downto 0);
        read_data2 : out std_logic_vector(15 downto 0)
    );
End RegFile;
