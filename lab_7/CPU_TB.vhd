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

        -- ADD r2, r1, r1
        instruction <= x"0211"; wait for tick;

        -- ADD r3, r2, r1
        instruction <= x"0321"; wait for tick;

        -- ADD r4, r3, r2
        instruction <= x"0432"; wait for tick;

        -- Sub r5, r4, r3
        instruction <= x"1543"; wait for tick;

        -- Sub r1, r5, r1
        instruction <= x"1151"; wait for tick;

        -- Sub r0, r3, r0
        instruction <= x"1030"; wait for tick;
        
		  -- And r6, r1, r1
        instruction <= x"2611"; wait for tick;

		  -- And r7, r3, r0
        instruction <= x"2730"; wait for tick;

 		  -- OR r8, r4, r1
        instruction <= x"3841"; wait for tick;
        wait;
    end process driver;

    clock_p : process is
    begin
        for i in 0 to 18 loop
            clock <= '1'; wait for tick/2;
            clock <= '0'; wait for tick/2;
        end loop;
        wait;
    end process clock_p;
end architecture mixed;
