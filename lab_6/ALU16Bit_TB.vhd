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
    
    signal OpCode : std_logic_vector(1 downto 0);
    signal A : std_logic_vector(15 downto 0);
    signal B : std_logic_vector(15 downto 0);
    signal Sum      : std_logic_vector(15 downto 0);
    signal CarryOut : std_logic; 
begin
	uut : ALU16Bit port map(
    	s => OpCode,
    	a => A,
        b => B,
        sout => Sum,
        cout => CarryOut
    );
    process
    begin
    	OpCode <= "00";
        A <= x"0000";
        B <= x"0000";
        wait for 10ns;
        
        
        
        OpCode <= "00";
        A <= x"0064";
        B <= x"00e6";
        wait for 10ns;
        
        OpCode <= "00";
        A <= x"FFEC";
        B <= x"003C";
        wait for 10ns;
        
        OpCode <= "00";
        A <= x"0001";
        B <= x"0001";
        wait for 10ns;
        
        OpCode <= "01";
        A <= x"01F4";
        B <= x"0154";
        wait for 10ns;
        
        OpCode <= "01";
        A <= x"0037";
        B <= x"0046";
        wait for 10ns;
        
        OpCode <= "01";
        A <= x"FFFF";
        B <= x"000E";
        wait for 10ns;
        
        OpCode <= "10";
        A <= x"0080";
        B <= x"0200";
        wait for 10ns;
        
        OpCode <= "10";
        A <= x"0BB8";
        B <= x"0002";
        wait for 10ns;
        
        OpCode <= "10";
        A <= x"14DE";
        B <= x"03D2";
        wait for 10ns;
        
        OpCode <= "11";
        A <= x"0010";
        B <= x"0008";
        wait for 10ns;
        
        OpCode <= "11";
        A <= x"0000";
        B <= x"0929";
        wait for 10ns;
        
        OpCode <= "11";
        A <= x"FFFF";
        B <= x"0005";
        wait for 10ns;
    end process;
end Behavioral;
