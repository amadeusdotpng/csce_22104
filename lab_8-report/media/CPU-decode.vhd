architecture Behavioral of CPU is
    -- Components + Signals
    ...
begin
    -- Instruction Fetch
    ...

    -- Instruction Decode

    -- new!
    ControlBlock : Control
    port map(
        op => OP,
        ctrl_alu_op => ALUOP,
        ctrl_alu_src => ALUSource
    );

    -- new!
    ImmediateExtension : ImmExt
    port map (
        imm => RT,
        ext => Immediate
    );

    CPU_Registers_0: RegFile port map( ... );

    ALUInput <= Immediate when ALUSource = '1' else RTData; -- new!

    -- Execute
    ...
end Behavioral;
