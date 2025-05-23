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

        -- ADDI R3, R0, 5
        instruction <= x"4305"; wait for tick;

        -- ADDI R4, R0, 2
        instruction <= x"4402"; wait for tick;

        -- SLT R11, R3, R4
        instruction <= x"7B34"; wait for tick;

        -- SW R3, 0(R0)
        instruction <= x"C300"; wait for tick;

        -- SW R4, 4(R0)
        instruction <= x"C404"; wait for tick;

        -- ADDI R6, R0, 4
        instruction <= x"4604"; wait for tick;

        -- LW R7, 0(R6)
        instruction <= x"8760"; wait for tick;
        
        -- LW R8, 0(R0)
        instruction <= x"8800"; wait for tick;
        
        -- ADD R9, R7, R8
        instruction <= x"0978"; wait for tick;

        -- SLT R11, R3, R4
        instruction <= x"7A01"; wait for tick;

        -- SLT R11, R3, R4
        instruction <= x"7A10"; wait for tick;

        wait;
    end process driver;

    clock_p : process is
    begin
        for i in 0 to 11 loop
            clock <= '1'; wait for tick/2;
            clock <= '0'; wait for tick/2;
        end loop;
        wait;
    end process clock_p;
end architecture mixed;
