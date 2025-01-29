-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use std.env.stop;

entity ClockTestbench is
end ClockTestbench;

architecture Behavioral of ClockTestbench is
	component ClockCounter
    	port(
        	clk  : in  std_logic;
        	rst  : in  std_logic;
        	en   : in  std_logic;
        	Cout : out std_logic;
        	H    : out std_logic_vector(4 downto 0);
        	M    : out std_logic_vector(5 downto 0);
        	S    : out std_logic_vector(5 downto 0)
        );
    end component;
    
    signal Clock    : std_logic;
    signal Reset    : std_logic;
    signal Enable   : std_logic;
    signal Seconds  : std_logic_vector(5 downto 0);
    signal Minutes  : std_logic_vector(5 downto 0);
    signal Hours    : std_logic_vector(4 downto 0);
    signal Midnight : std_logic;
    
    constant ClockPeriod : time := 10ns;
    
begin
    ClockProcess : process
    begin
    	Clock <= '0';
        wait for ClockPeriod / 2;
        Clock <= '1';
        wait for ClockPeriod / 2;
    end process;
    
    StimulusProcess : process
    begin
    	Reset <= '1';
        Enable <= '0';
        wait for ClockPeriod;
        
        Reset <= '0';
        Enable <= '1';
        wait for ClockPeriod * 15;
        -- Need to test for 00:00:15 (00:00:0F)
        assert Seconds = X"0F" report "Test 1/5: Expected Seconds: 0F, Actual: " & to_hstring(Seconds) & "." severity error;
        assert Minutes = X"00" report "Test 1/5: Expected Minutes: 00, Actual: " & to_hstring(Minutes) & "." severity error;
        assert Hours   = X"00" report "Test 1/5: Expected Hours: 00, Actual: " & to_hstring(Hours) & "." severity error;
        
        Reset <= '1';
        Enable <= '0';
        wait for ClockPeriod;
        -- Need to test for 00:00:00
        assert Seconds = X"00" report "Test 2/5: Expected Seconds: 00, Actual: " & to_hstring(Seconds) & "." severity error;
        assert Minutes = X"00" report "Test 2/5: Expected Minutes: 00, Actual: " & to_hstring(Minutes) & "." severity error;
        assert Hours   = X"00" report "Test 2/5: Expected Hours: 00, Actual: " & to_hstring(Hours) & "." severity error;
        
        Reset <= '0';
        Enable <= '1';
        wait for ClockPeriod * 2835;
        -- Need to test for 00:47:15 (00:2F:0F)
        assert Seconds = X"0F" report "Test 3/5: Expected Seconds: 0F, Actual: " & to_hstring(Seconds) & "." severity error;
        assert Minutes = X"2F" report "Test 3/5: Expected Minutes: 2F, Actual: " & to_hstring(Minutes) & "." severity error;
        assert Hours   = X"00" report "Test 3/5: Expected Hours: 00, Actual: " & to_hstring(Hours) & "." severity error;
        
        wait for ClockPeriod * 3600;
        -- Need to test for 01:47:15 (02:2F:0F)
        assert Seconds = X"0F" report "Test 4/5: Expected Seconds: 0F, Actual: " & to_hstring(Seconds) & "." severity error;
        assert Minutes = X"2F" report "Test 4/5: Expected Minutes: 2F, Actual: " & to_hstring(Minutes) & "." severity error;
        assert Hours   = X"01" report "Test 4/5: Expected Hours: 01, Actual: " & to_hstring(Hours) & "." severity error;
        
        Reset <= '0';
        Enable <= '0';
        wait for ClockPeriod;
        -- Need to test for 01:47:15
        assert Seconds = X"0F" report "Test 5/5: Expected Seconds: 0F, Actual: " & to_hstring(Seconds) & "." severity error;
        assert Minutes = X"2F" report "Test 5/5: Expected Minutes: 2F, Actual: " & to_hstring(Minutes) & "." severity error;
        assert Hours   = X"01" report "Test 5/5: Expected Hours: 01, Actual: " & to_hstring(Hours) & "." severity error;
        
    	stop;
    end process;

	UnitUnderTest : ClockCounter port map(
    	clk  => Clock,
        rst  => Reset,
        en   => Enable,
        Cout => Midnight,
        H    => Hours,
        M    => Minutes,
        S    => Seconds
    );

end Behavioral;

