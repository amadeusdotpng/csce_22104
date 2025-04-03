architecture Behavioral of CPU is
    ...
begin
    -- Instruction Fetch
    ...

    -- Instruction Decode
    CPU_RegisteRS_0: RegFile
    port map(
        clk   => clk,
        clear => clear,

        write_addr => RD,
        write_data => Sout_ALU,
        load       => '1',

        read_addr1 => RS,
        read_addr2 => RT,

        read_data1 => RSData,
        read_data2 => RTData
    );

    -- Execute
    ...
    
end Behavioral;
