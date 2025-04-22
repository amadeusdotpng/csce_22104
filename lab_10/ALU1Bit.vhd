library IEEE;
use IEEE.std_logic_1164.all;

entity ALU1Bit is
    port(
        s : in std_logic_vector(1 downto 0);
        a : in std_logic;
        b : in std_logic;
        cin  : in std_logic;
        sout : out std_logic;
        cout : out std_logic
    );
end ALU1Bit;

architecture Datapath of ALU1Bit is
	signal inverse_b  : std_logic;
    signal sout_adder : std_logic;
    signal sout_and   : std_logic;
    signal sout_or    : std_logic;
begin
	inverse_b <= b xor s(0);
    
    sout_adder <= a xor inverse_b xor cin;
    sout_and   <= a and b;
    sout_or    <= a or  b;
    
    sout <= sout_adder when s(1) = '0' else
            sout_and   when s = "10" else
            sout_or    when s = "11";
    
    cout <= (a and inverse_b) or (cin and a) or (cin and inverse_b);
end Datapath;