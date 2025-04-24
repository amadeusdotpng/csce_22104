architecture Behavioral of CPU is
    -- Components + Signals
    ...
begin
    -- Instruction Fetch + Instruction Decode + Execute + Memory
    ...
    
    -- WriteBack
    WriteBack <= MemoryOutput when RegisterSource = "00" else
                 ALUOutput    when RegisterSource = "01" else
                 "000" & x"000" & ALUOutput(15);

end Behavioral;
