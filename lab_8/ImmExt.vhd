library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ImmExt is
	port(
    	imm : in std_logic_vector(3 downto 0);
        ext : out std_logic_vector(15 downto 0)
     );
end ImmExt;

architecture Datapath of ImmExt is
	signal extension : std_logic_vector(11 downto 0);
begin
    extension <= x"111" when imm(3) = '1' else x"000";
    ext <= extension & imm;
end Datapath;
