architecture Datapath of Control is
begin
    ctrl_alu_op <= op(1 downto 0);
    ctrl_alu_src <= '1' when op "1000" else op(2);   -- new!
    
    ctrl_reg_src   <= '0' when op = "1000" else '1'; -- new!
    ctrl_reg_dst   <= '1' when op = "1100" else '0'; -- new!
    ctrl_reg_write <= '0' when op = "1100" else '1'; -- new!

    ctrl_mem_read  <= '1' when op = "1000" else '0'; -- new!
    ctrl_mem_write <= '1' when op = "1100" else '0'; -- new!
end Datapath;
