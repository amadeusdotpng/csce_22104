architecture Behavioral of CPU is
    -- Components + Signals
    ...
begin
    -- Instruction Fetch
    ...
    -- Instruction Decode
    ...
    Register2Address <= RD when RegisterDestination = '1' else RT;
    CPU_Registers_0: RegFile
    port map(
        clk   => clk,
        clear => clear,

        a_addr => RD,
        a_data => WriteBack,
        load   => RegisterWrite,

        b_addr => RS,
        c_addr => Register2Address,

        b_data => RSData,
        c_data => Register2Data
    );
    ALUInput <= Immediate when ALUSource = '1' else Register2Data;
    -- Execute + Memory
    ...
    -- WriteBack
    WriteBack <= ALUOutput when RegisterSource = '1' else MemoryOutput;
end Behavioral;

