library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity PC_REG is
	port(
		clk : in std_logic;
		reset : in std_logic;
		Input : in std_logic_vector(15 downto 0);
		Output : out std_logic_vector(15 downto 0)
	);
end PC_REG;

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