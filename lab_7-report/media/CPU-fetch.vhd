architecture Behavioral of CPU is
    ...
begin
    -- Instruction Fetch
    OP <= instruction(15 downto 12);
    RD <= instruction(11 downto 8 );
    RS <= instruction( 7 downto 4 );
    RT <= instruction( 3 downto 0 );

    -- Instruction Decode
    ...

    -- Execute
    ...
end Behavioral;
