library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.env.stop;

entity FullAdderTB is
end FullAdderTB;

architecture Behavioral of FullAdderTB is 
    component FullAdder
    	port(
        	A    : in std_logic;
        	B    : in std_logic;
        	cin  : in std_logic;
        	S    : out std_logic;
        	cout : out std_logic 
        );
    end component;
    
    signal A        :  std_logic;
    signal B        :  std_logic;
    signal CarryIn  :  std_logic;
    signal Sum      :  std_logic;
    signal CarryOut :  std_logic; 
begin
	uut : FullAdder port map(
    	A    => A,
        B    => B,
        cin  => CarryIn,
        S    => Sum,
        cout => CarryOut
    );
	process
    begin
    	A <= '0';
        B <= '0';
        CarryIn <= '0';
        wait for 2ns;
        assert Sum = '0' report "Test 1/8: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 1/8: Incorrect CarryOut" severity error;
        
        A <= '0';
        B <= '0';
        CarryIn <= '1';
        wait for 2ns;
        assert Sum = '1' report "Test 2/8: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 2/8: Incorrect CarryOut" severity error;
        
        A <= '0';
        B <= '1';
        CarryIn <= '0';
        wait for 2ns;
        assert Sum = '1' report "Test 3/8: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 3/8: Incorrect CarryOut" severity error;
        
        A <= '0';
        B <= '1';
        CarryIn <= '1';
        wait for 2ns;
        assert Sum = '0' report "Test 4/8: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 4/8: Incorrect CarryOut" severity error;
        
        A <= '1';
        B <= '0';
        CarryIn <= '0';
        wait for 2ns;
        assert Sum = '0' report "Test 5/8: Incorrect Sum" severity error;
        assert CarryOut = '0' report "Test 5/8: Incorrect CarryOut" severity error;
        
        A <= '1';
        B <= '0';
        CarryIn <= '1';
        wait for 2ns;
        assert Sum = '0' report "Test 6/8: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 6/8: Incorrect CarryOut" severity error;
        
        A <= '1';
        B <= '1';
        CarryIn <= '0';
        wait for 2ns;
        assert Sum = '0' report "Test 7/8: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 7/8: Incorrect CarryOut" severity error;
        
        A <= '1';
        B <= '1';
        CarryIn <= '1';
        wait for 2ns;
        assert Sum = '1' report "Test 8/8: Incorrect Sum" severity error;
        assert CarryOut = '1' report "Test 8/8: Incorrect CarryOut" severity error;
        
        A <= '0';
        B <= '0';
        CarryIn <= '0';
        wait for 2 ns;
        
        stop;
    end process;
end Behavioral;