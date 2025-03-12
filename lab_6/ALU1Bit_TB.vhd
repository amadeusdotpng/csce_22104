-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.env.stop;

entity ALU1Bit_TB is
end ALU1Bit_TB;

architecture Behavioral of ALU1Bit_TB is 
    component ALU1Bit
    	port(
            s : in std_logic_vector(1 downto 0);
            a : in std_logic;
            b : in std_logic;
            cin  : in std_logic;
            sout : out std_logic;
            cout : out std_logic
        );
    end component;
    
    signal S : std_logic_vector(1 downto 0);
    signal A : std_logic;
    signal B : std_logic;
    signal CarryIn  : std_logic;
    signal Sum      :  std_logic;
    signal CarryOut :  std_logic; 
begin
	uut : ALU1Bit port map(
    	s => S,
    	a => A,
        b => B,
        cin => CarryIn,
        sout => Sum,
        cout => CarryOut
    );
    
    process
    begin
    	S <= "00";
        wait for 40ns;
        S <= "01";
        wait for 40ns;
        S <= "10";
        wait for 40ns;
        S <= "11";
        wait for 40ns;
    	stop;
    end process;
    process
    begin
		A <= '0';
        B <= '0';
        CarryIn <= '0';
        wait for 5ns;
        
        A <= '0';
        B <= '0';
        CarryIn <= '1';
        wait for 5ns;
        
        A <= '0';
        B <= '1';
        CarryIn <= '0';
        wait for 5ns;
        
        A <= '0';
        B <= '1';
        CarryIn <= '1';
        wait for 5ns;
        
        A <= '1';
        B <= '0';
        CarryIn <= '0';
        wait for 5ns;
        
        A <= '1';
        B <= '0';
        CarryIn <= '1';
        wait for 5ns;
        
        A <= '1';
        B <= '1';
        CarryIn <= '0';
        wait for 5ns;
        
        A <= '1';
        B <= '1';
        CarryIn <= '1';
        wait for 5ns;
    end process;
end Behavioral;
