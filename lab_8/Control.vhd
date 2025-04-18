library ieee;
use ieee.std_logic_1164.all;

entity Control is
	port(
    	op           : in std_logic_vector(3 downto 0);
        ctrl_alu_op  : out std_logic_vector(1 downto 0);
        ctrl_alu_src : out std_logic
     );
end Control;

architecture Datapath of Control is
begin
    ctrl_alu_op <= op(1 downto 0);
    ctrl_alu_src <= op(2);
end Datapath;
