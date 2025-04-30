architecture Behavioral of PC_REG is
	signal Reg : std_logic_vector(15 downto 0) := x"0000";
    signal Delay : std_logic;
begin
	process(reset, clk)
	begin
		if (reset = '0') then
			Reg <= x"0000";
            Delay  <= '1';
		elsif (clk'event and clk='1') then
        	if (Delay = '1') then
            	Reg <= x"0000";
                Delay <= '0';
            else
			    Reg <= Input + 2;
            end if;
		end if; 
	end process;
    Output <= Reg;
end Behavioral;
