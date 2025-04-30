architecture Behavioral of CPU is
    -- Components + Signals
    ...
begin
    -- Instruction Fetch
    PCRegister : PC_REG              -- new!
    port map (
		clk    => clk,
		reset  => clear,
		Input  => PC,
		Output => PC
	);
    InstructionMemory : Memory       -- new!
    port map(
    	clk      => clk,
        read_en  => '1',
        write_en => '0',
        addr => PC,
        data_in  => x"0000",
        data_out => Instruction,
        mem_dump => '0'
    );
    OP <= Instruction(15 downto 12); -- new!
    RD <= Instruction(11 downto  8); -- new!
    RS <= Instruction( 7 downto  4); -- new!
    RT <= Instruction( 3 downto  0); -- new!

    -- Instruction Decode + Execute + Memory + Writeback
    ...
end Behavioral;
