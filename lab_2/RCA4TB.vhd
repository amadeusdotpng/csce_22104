library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.env.stop;

entity RCATestbench is
end RCATestbench;

architecture Behavioral of RCATestbench is
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
    	A <= X"E";
        B <= X"C";
        CarryIn <= '0';
        wait for 10 ns;
        assert Sum = X"A" report "Test 1/5: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 1/5: Incorrect CarryOut" severity error;
        
        A <= X"7";
        B <= X"2";
        CarryIn <= '0';
        wait for 10 ns;
        assert Sum = X"9" report "Test 2/5: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 2/5: Incorrect CarryOut" severity error;
        
        A <= X"3";
        B <= X"D";
        CarryIn <= '0';
        wait for 10 ns;
        assert Sum = X"0" report "Test 3/5: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 3/5: Incorrect CarryOut" severity error;
        
        A <= X"F";
        B <= X"F";
        CarryIn <= '1';
        wait for 10 ns;
        assert Sum = X"F" report "Test 4/5: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 4/5: Incorrect CarryOut" severity error;
        
        A <= X"B";
        B <= X"0";
        CarryIn <= '1';
        wait for 10 ns;
        assert Sum = X"C" report "Test 5/5: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 5/5: Incorrect CarryOut" severity error;
        
        
        A <= X"0";
        B <= X"0";
        CarryIn <= '0';
        wait for 10 ns;
        
    	stop;
    end process;
    
    UnitUnderTest : RCA4 port map(
    	A    => A,
        B    => B,
        Cin  => CarryIn,
        S    => Sum,
        Cout => CarryOut
    );
end Behavioral;