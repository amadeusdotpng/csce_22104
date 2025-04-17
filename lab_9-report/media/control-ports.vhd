entity Control is
	port(
    	op : in std_logic_vector(3 downto 0);
        
        ctrl_alu_op  : out std_logic_vector(1 downto 0);
        ctrl_alu_src : out std_logic;
        
        ctrl_reg_src   : out std_logic; -- new!
        ctrl_reg_dst   : out std_logic; -- new!
        ctrl_reg_write : out std_logic; -- new!

        ctrl_mem_read  : out std_logic; -- new!
        ctrl_mem_write : out std_logic  -- new!
     );
end Control;
