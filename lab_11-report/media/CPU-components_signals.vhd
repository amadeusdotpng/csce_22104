architecture Behavioral of CPU is
    -- Components
    ...

    -- new!
    component PC_REG
    port(
		clk : in std_logic;
		reset : in std_logic;
		Input : in std_logic_vector(15 downto 0);
		Output : out std_logic_vector(15 downto 0)
	);
    end component;
    
    ...
    
    -- Signals
    signal PC : std_logic_vector(15 downto 0);          -- new!
    signal Instruction : std_logic_vector(15 downto 0); -- new!
    
    signal OP : std_logic_vector(3 downto 0);
    ...
begin
    ...
end Behavioral;
