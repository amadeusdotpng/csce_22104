architecture Behavioral of CPU is
    -- Component + Signals
    ...
begin
    -- Instruction Fetch
    ...

    -- Instruction Decode
    ...

    -- Execute
    CPU_ALU_0: ALU16Bit
    port map(
        A => RSData,
        B => ALUInput, -- new!
        S => ALUOP,    -- new!
        Sout => ALUSout,
        Cout => cout
    );
end Behavioral;
