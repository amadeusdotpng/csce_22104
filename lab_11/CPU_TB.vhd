library ieee;
use ieee.std_logic_1164.all;


entity CPU_TB is
end entity CPU_TB;


architecture mixed of CPU_TB is
    constant tick : time := 100 ns;
    signal reset, clock : std_logic;
begin
    uut : entity work.CPU
        port map(
            clk		    => clock,
            clear	    => reset
        );

    driver : process is
    begin
        -- reset the system
        reset <= '0'; wait for 50 ns;
        reset <= '1';

--         -- ADDI R3, R0, 5
--         instruction <= x"0211"; wait for tick;

--         -- ADDI R4, R0, 2
--         instruction <= x"4325"; wait for tick;

--         -- SW R3, 0(R0)
--         instruction <= x"1432"; wait for tick;

--         -- SW R4, 4(R0)
--         instruction <= x"554C"; wait for tick;

--         -- ADDI R6, R0, 4
--         instruction <= x"2635"; wait for tick;

--         -- LW R7, 0(R6)
--         instruction <= x"3754"; wait for tick;
        
--         -- LW R8, 0(R0)
--         instruction <= x"3754"; wait for tick;
        
--         -- ADD R9, R7, R8
--         instruction <= x"3754"; wait for tick;
        wait;
    end process driver;

    clock_p : process is
    begin
        for i in 0 to 16 loop
            clock <= '1'; wait for tick/2;
            clock <= '0'; wait for tick/2;
        end loop;
        wait;
    end process clock_p;
end architecture mixed;
