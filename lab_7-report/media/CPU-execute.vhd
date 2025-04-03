architecture Behavioral of CPU is
    ...
begin
    -- Instruction Fetch
    ...

    -- Instruction Decode
    ...

    -- Execute
    CPU_ALU_0: ALU16Bit
    port map(
        a => RSData,
        b => RTData,
        s => OP(1 downto 0),
        sout => Sout_ALU,
        cout => cout
    );
end Behavioral;
