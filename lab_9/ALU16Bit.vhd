library IEEE;
use IEEE.std_logic_1164.all;

entity ALU16Bit is
    port(
        s : in std_logic_vector(1 downto 0);
        a : in std_logic_vector(15 downto 0);
        b : in std_logic_vector(15 downto 0);
        sout : out std_logic_vector(15 downto 0);
        cout : out std_logic
    );
end ALU16Bit;

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
	bit0 : ALU1Bit port map(s, a(16#0#), b(16#0#), s(16#0#)    , sout(16#0#), carry(16#0#));
    bit1 : ALU1Bit port map(s, a(16#1#), b(16#1#), carry(16#0#), sout(16#1#), carry(16#1#));
    bit2 : ALU1Bit port map(s, a(16#2#), b(16#2#), carry(16#1#), sout(16#2#), carry(16#2#));
    bit3 : ALU1Bit port map(s, a(16#3#), b(16#3#), carry(16#2#), sout(16#3#), carry(16#3#));
    bit4 : ALU1Bit port map(s, a(16#4#), b(16#4#), carry(16#3#), sout(16#4#), carry(16#4#));
    bit5 : ALU1Bit port map(s, a(16#5#), b(16#5#), carry(16#4#), sout(16#5#), carry(16#5#));
    bit6 : ALU1Bit port map(s, a(16#6#), b(16#6#), carry(16#5#), sout(16#6#), carry(16#6#));
    bit7 : ALU1Bit port map(s, a(16#7#), b(16#7#), carry(16#6#), sout(16#7#), carry(16#7#));
    bit8 : ALU1Bit port map(s, a(16#8#), b(16#8#), carry(16#7#), sout(16#8#), carry(16#8#));
    bit9 : ALU1Bit port map(s, a(16#9#), b(16#9#), carry(16#8#), sout(16#9#), carry(16#9#));
    bitA : ALU1Bit port map(s, a(16#A#), b(16#A#), carry(16#9#), sout(16#A#), carry(16#A#));
    bitB : ALU1Bit port map(s, a(16#B#), b(16#B#), carry(16#A#), sout(16#B#), carry(16#B#));
    bitC : ALU1Bit port map(s, a(16#C#), b(16#C#), carry(16#B#), sout(16#C#), carry(16#C#));
    bitD : ALU1Bit port map(s, a(16#D#), b(16#D#), carry(16#C#), sout(16#D#), carry(16#D#));
    bitE : ALU1Bit port map(s, a(16#E#), b(16#E#), carry(16#D#), sout(16#E#), carry(16#E#));
    bitF : ALU1Bit port map(s, a(16#F#), b(16#F#), carry(16#E#), sout(16#F#), cout);
end Datapath;