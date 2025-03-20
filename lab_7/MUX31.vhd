Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;

entity MUX31 is
port(	Input1		:	in	std_logic;
		Input2		:	in	std_logic;
		Input3		:	in	std_logic;
		S			:	in	std_logic_vector(3 downto 0);
		Sout		:	out	std_logic);
end MUX31;

architecture Behavioral of MUX31 is

Begin
--MUX31 Logic (using When - ElSE structure)
	Sout <=	Input1 when S="0000" else
				Input1 when S="0001" else
				Input2 when S="0010" else
				Input3 when S="0011";


end Behavioral;

