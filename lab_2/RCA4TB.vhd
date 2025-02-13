-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.env.stop;

entity RCA4TB is
end RCA4TB;

architecture Behavioral of RCA4TB is
	signal A        :  std_logic_vector(3 downto 0);
    signal B        :  std_logic_vector(3 downto 0);
    signal CarryIn  :  std_logic;
    signal Sum      :  std_logic_vector(3 downto 0);
    signal CarryOut :  std_logic; 
    
    component RCA4
    	port(
        	A    : in std_logic_vector(3 downto 0);
        	B    : in std_logic_vector(3 downto 0);
        	Cin  : in std_logic;
        	S    : out std_logic_vector(3 downto 0);
        	Cout : out std_logic 
        );
    end component;
begin
	process
    begin
    	A <= X"3";
        B <= X"4";
        CarryIn <= '0';
        wait for 10 ns;
        assert Sum = X"7" report "Test 1/6: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 1/6: Incorrect CarryOut" severity error;
        
        A <= X"2";
        B <= X"8";
        CarryIn <= '1';
        wait for 10 ns;
        assert Sum = X"B" report "Test 2/6: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 2/6: Incorrect CarryOut" severity error;
        
        A <= X"0";
        B <= X"7";
        CarryIn <= '0';
        wait for 10 ns;
        assert Sum = X"7" report "Test 3/6: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 3/6: Incorrect CarryOut" severity error;
        
        A <= X"A";
        B <= X"5";
        CarryIn <= '1';
        wait for 10 ns;
        assert Sum = X"0" report "Test 4/6: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 4/6: Incorrect CarryOut" severity error;
        
        A <= X"B";
        B <= X"A";
        CarryIn <= '0';
        wait for 10 ns;
        assert Sum = X"5" report "Test 5/6: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 5/6: Incorrect CarryOut" severity error;
        
        A <= X"F";
        B <= X"C";
        CarryIn <= '1';
        wait for 10 ns;
        assert Sum = X"C" report "Test 6/6: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 6/6: Incorrect CarryOut" severity error;
        
        
        
        A <= X"0";
        B <= X"0";
        CarryIn <= '0';
        wait for 10 ns;
        
    	stop;
    end process;
    
    uut : RCA4 port map(
    	A    => A,
        B    => B,
        Cin  => CarryIn,
        S    => Sum,
        Cout => CarryOut
    );
end Behavioral;