entity CPU is
    port(
        clk         : in std_logic;
        clear       : in std_logic;
        instruction : in std_logic_vector(15 downto 0)
     );
end CPU;
