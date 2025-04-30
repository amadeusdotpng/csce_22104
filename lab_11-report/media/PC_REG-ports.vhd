entity PC_REG is
	port(
		clk : in std_logic;
		reset : in std_logic;
		Input : in std_logic_vector(15 downto 0);
		Output : out std_logic_vector(15 downto 0)
	);
end PC_REG;
