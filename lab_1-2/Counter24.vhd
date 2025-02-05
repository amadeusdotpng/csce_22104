library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
  
entity Counter24 is
	port(
		clk : in std_logic;
        rst : in std_logic;
        en  : in std_logic;
        fout: out std_logic_vector(4 downto 0);
        cout: out std_logic
	);
end Counter24;

architecture Behavioral of Counter24 is
signal count : std_logic_vector(4 downto 0);
signal carry : std_logic;
begin
	process(clk, en, rst)
	begin
		if(clk'event and clk = '1') then
        	if(rst = '1') then
            	count <= "00000";
                carry <= '0';
            elsif(en = '1') then
            	if(count = "10110") then -- 22
                	count <= "10111";
                    carry <= '1';
                else
                	carry <= '0';
                    if(count = "10111") then -- 23
                		count <= "000000";
                    else
            			count <= count + 1;
                    end if;
                end if;
            else
            	count <= count;
                carry <= carry;
            end if;
        else
        	count <= count;
        end if;
	end process;
	fout <= count;
    cout <= carry;
end Behavioral;