architecture Datapath of ALU16Bit is
	component ALU1Bit
    	port(
        	s : in std_logic_vector(1 downto 0);
            a : in std_logic;
            b : in std_logic;
            cin  : in std_logic;
            sout : out std_logic;
            cout : out std_logic
        );
     end component;
     signal carry : std_logic_vector(14 downto 0);
begin
	bit0 : ALU1Bit port map(s, a(0),  b(0),  s(0),      sout(0),  carry(0) );
    bit1 : ALU1Bit port map(s, a(1),  b(1),  carry(0),  sout(1),  carry(1) );
    bit2 : ALU1Bit port map(s, a(2),  b(2),  carry(1),  sout(2),  carry(2) );
    bit3 : ALU1Bit port map(s, a(3),  b(3),  carry(2),  sout(3),  carry(3) );
    bit4 : ALU1Bit port map(s, a(4),  b(4),  carry(3),  sout(4),  carry(4) );
    bit5 : ALU1Bit port map(s, a(5),  b(5),  carry(4),  sout(5),  carry(5) );
    bit6 : ALU1Bit port map(s, a(6),  b(6),  carry(5),  sout(6),  carry(6) );
    bit7 : ALU1Bit port map(s, a(7),  b(7),  carry(6),  sout(7),  carry(7) );
    bit8 : ALU1Bit port map(s, a(8),  b(8),  carry(7),  sout(8),  carry(8) );
    bit9 : ALU1Bit port map(s, a(9),  b(9),  carry(8),  sout(9),  carry(9) );
    bitA : ALU1Bit port map(s, a(10), b(10), carry(9),  sout(10), carry(10));
    bitB : ALU1Bit port map(s, a(11), b(11), carry(10), sout(11), carry(11));
    bitC : ALU1Bit port map(s, a(12), b(12), carry(11), sout(12), carry(12));
    bitD : ALU1Bit port map(s, a(13), b(13), carry(12), sout(13), carry(13));
    bitE : ALU1Bit port map(s, a(14), b(14), carry(13), sout(14), carry(14));
    bitF : ALU1Bit port map(s, a(15), b(15), carry(14), sout(15), cout     );
end Datapath;

