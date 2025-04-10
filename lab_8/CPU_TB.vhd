library ieee;
use ieee.std_logic_1164.all;


entity CPU_TB is
end entity CPU_TB;


architecture mixed of CPU_TB is
    constant tick : time := 100 ns;
    signal reset, clock : std_logic;
    signal instruction : std_logic_vector(15 downto 0);
begin
    uut : entity work.CPU
        port map(
            clk		    => clock,
            clear	    => reset,
            instruction => instruction
        );

    driver : process is
    begin
        -- reset the system
        reset <= '0'; instruction <= x"0000"; wait for 50 ns;
        reset <= '1';

        -- ADD R2, R1, R1
        instruction <= x"0211"; wait for tick;

        -- ADDI R3, R2, 5
        instruction <= x"4325"; wait for tick;

        -- SUB R4, R3, R2
        instruction <= x"1432"; wait for tick;

        -- SUBI R5, R4, -4
        instruction <= x"554C"; wait for tick;

        -- AND R6, R3, R5
        instruction <= x"2635"; wait for tick;

        -- OR R7, R5, R4
        instruction <= x"3754"; wait for tick;
        
        wait;
    end process driver;

    clock_p : process is
    begin
        for i in 0 to 6 loop
            clock <= '1'; wait for tick/2;
            clock <= '0'; wait for tick/2;
        end loop;
        wait;
    end process clock_p;
end architecture mixed;
