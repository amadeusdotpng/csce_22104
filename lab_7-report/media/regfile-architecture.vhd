architecture syn of RegisterFile is
    type ram_type is array (15 downto 0) of std_logic_vector(15 downto 0);
    signal REG_FILE : ram_type;    
begin
    process(clk, load, clear)
    begin
        if (clear = '0') then
            REG_FILE(0)  <= x"0000";
            REG_FILE(1)  <= x"0001";
            ...
            REG_FILE(15) <= x"0000";
        elsif (clk'event and clk='1' and load='1') then
            REG_FILE(conv_integer(write_addr)) <= write_data;
        end if;
        REG_FILE(0) <= x"0000";
        REG_FILE(1) <= x"0001";
    end process;
    read_data1 <= REG_FILE(conv_integer(read_addr1));
    read_data2 <= REG_FILE(conv_integer(read_addr2));
end syn;
