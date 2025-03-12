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
    component Mux4to1
        port(
            s: in std_logic_vector(1 downto 0);
            x: in std_logic;
            y: in std_logic;
            z: in std_logic;
            w: in std_logic;
            b: out std_logic
        );
    end component;
    component FullAdder
        port(
            a: in std_logic;
            b: in std_logic;
            cin: in std_logic;
            sout: out std_logic;
            cout: out std_logic
        );
    end component;
    signal sout_fulladder : std_logic;
    signal sout_and       : std_logic;
    signal sout_or        : std_logic;
begin
	fa : FullAdder port map (
    	a => a,
        b => b xor s(0),
        cin => cin,
        sout => sout_fulladder,
        cout => cout
    );
    sout_and <= a and b;
    sout_or  <= a or b;
    
	mux : Mux4to1 port map(
    	s => s,
        x => sout_fulladder,
        y => sout_fulladder,
        z => sout_and,
        w => sout_or,
        b => sout
    );
end Datapath;
