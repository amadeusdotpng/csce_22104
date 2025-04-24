architecture Datapath of Control is
begin
    ctrl_alu_op  <= "01" when op = "0111" else op(1 downto 0); -- changed!
    ctrl_alu_src <= '1'  when op = "1000" else                 -- changed!
                    '0'  when op = "0111" else op(2);
    
    ctrl_reg_src   <= "00" when op = "1000" else               -- changed!
                      "10" when op = "0111" else "01";
    ctrl_reg_dst   <= '1'  when op = "1100" else '0';
    ctrl_reg_write <= '0'  when op = "1100" else '1';

    ctrl_mem_read  <= '1' when op = "1000" else '0';
    ctrl_mem_write <= '1' when op = "1100" else '0';
end Datapath;
