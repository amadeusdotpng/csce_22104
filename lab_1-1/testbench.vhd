library IEEE;
use IEEE.std_logic_1164.all;
use std.env.stop;

entity counter_10_test is
end counter_10_test;

architecture Behavioral of counter_10_test is
	component counter_10
		port(
        	clock : in std_logic;
            reset : in std_logic;
            enable: in std_logic;
            output: out std_logic_vector(3 downto 0)
		);
	end component;
    

	-- Input signal initializations
	signal clk: std_logic;
    signal rst: std_logic;
    signal en : std_logic;
    
	-- Output signal declaration
    signal output: std_logic_vector(3 downto 0);
	constant clk_period : time := 10 ns;

begin
	uut: counter_10 port map(
		clock  => clk,
        reset  => rst,
        enable => en,
        output => output
	);
    
	clk_proc: process
	begin
		clk <= '0';
		wait for clk_period / 2;
		clk <= '1';
		wait for clk_period / 2;
	end process;
    
	stim_proc: process
	begin
    	rst <= '1';
        wait for clk_period;
        
		rst <= '0';
		en <= '0';
		wait for clk_period;
        
        en <= '1';
        wait for clk_period * 13;
        
        en <= '0';
        wait for clk_period * 2;
        
        rst <= '1';
        wait for clk_period;
        
        rst <= '0';
        wait for clk_period;
        
        en <= '1';
        wait for clk_period * 2;
        
        rst <= '1';
        wait for clk_period * 2;
        
        en <= '0';
        rst <= '0';
		wait for clk_period;
        stop;
	end process;
end;
