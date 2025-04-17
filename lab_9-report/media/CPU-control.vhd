architecture Behavioral of CPU is
    -- Components + Signals
    ...
begin
    ...
    -- Instruction Decode
    ControlBlock : Control
    port map(
        op => OP,

        ctrl_alu_op  => ALUOP,
        ctrl_alu_src => ALUSource,

        ctrl_reg_src   => RegisterSource,
        ctrl_reg_dst   => RegisterDestination,
        ctrl_reg_write => RegisterWrite,
        
        ctrl_mem_read  => MemoryRead,
        ctrl_mem_write => MemoryWrite
    );
    ...
end Behavioral;
