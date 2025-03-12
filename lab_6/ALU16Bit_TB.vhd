library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.env.stop;

entity ALU16Bit_TB is
end ALU16Bit_TB;


architecture Behavioral of ALU16Bit_TB is 
    component ALU16Bit
    	port(
            s : in std_logic_vector(1 downto 0);
            a : in std_logic_vector(15 downto 0);
            b : in std_logic_vector(15 downto 0);
            sout : out std_logic_vector(15 downto 0);
            cout : out std_logic
        );
    end component;
    
    signal S : std_logic_vector(1 downto 0);
    signal A : std_logic_vector(15 downto 0);
    signal B : std_logic_vector(15 downto 0);
    signal Sum      : std_logic_vector(15 downto 0);
    signal CarryOut : std_logic; 
begin
	uut : ALU16Bit port map(
    	s => S,
    	a => A,
        b => B,
        sout => Sum,
        cout => CarryOut
    );
    process
    begin
    end process;
end Behavioral;
