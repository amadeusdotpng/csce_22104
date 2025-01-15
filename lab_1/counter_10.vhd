library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
  
entity counter_10 is
	port(
		clock : in std_logic;
        reset : in std_logic;
        enable: in std_logic;
        output: out std_logic_vector(3 downto 0)
	);
end counter_10;

architecture Behavioral of counter_10 is
signal count : std_logic_vector(3 downto 0);
begin
	process(clock, enable, reset)
	begin
		if(clock'event and clock = '1') then
        	if(reset = '1') then
            	count <= "0000";
            elsif(enable = '1') then
            	if(count = "1001") then
                	count <= "0000";
                else
            		count <= count + 1;
                end if;
            end if;
        else
        	count <= count;
        end if;
	end process;
	output <= count;
end Behavioral;