library ieee;
use ieee.std_logic_1164.all;

entity Control is
	port(
    	op : in std_logic_vector(3 downto 0);
        
        ctrl_alu_op  : out std_logic_vector(1 downto 0);
        ctrl_alu_src : out std_logic;
        
        ctrl_reg_src   : out std_logic;
        ctrl_reg_dst   : out std_logic;
        ctrl_reg_write : out std_logic;
        
        ctrl_mem_read  : out std_logic;
        ctrl_mem_write : out std_logic
     );
end Control;

architecture Datapath of Control is
begin
    ctrl_alu_op <= op(1 downto 0);
    ctrl_alu_src <= '1' when op = "1000" else op(2);
    
    ctrl_reg_src   <= '0' when op = "1000" else '1';
    ctrl_reg_dst   <= '1' when op = "1100" else '0';
    ctrl_reg_write <= '0' when op = "1100" else '1';

    ctrl_mem_read  <= '1' when op = "1000" else '0';
    ctrl_mem_write <= '1' when op = "1100" else '0';
end Datapath;
