architecture Behavioral of CPU is
    -- Components + Signals
    ...
begin
    -- Instruction Fetch + Instruction Decode + Execute
    ...
    -- Memory
    MemoryBlock : Memory
    port map(
    	clk      => clk,
        read_en  => MemoryRead,
        write_en => MemoryWrite,
        
        addr => ALUOutput,
        data_in  => Register2Data,
        data_out => MemoryOutput,

        mem_dump => '0'
    );
    -- WriteBack
    ...
end Behavioral;

