library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA4 is
    port(
		A   : in std_logic_vector(3 downto 0);
		B   : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		S    : out std_logic_vector(3 downto 0);
		cout : out std_logic
    );
end RCA4;



architecture Structural of RCA4 is
    component FullAdder
        port(
            A   : in std_logic;
            B   : in std_logic;
            cin : in std_logic;
            S    : out std_logic;
            cout : out std_logic
        );
    end component;
    signal carry : std_logic_vector(2 downto 0);
begin

    Bit0 : FullAdder
    port map( 
        A => A(0),
        B => B(0),
        cin => cin, 
        S => S(0),
        cout => carry(0)
    );
	
    Bit1 : FullAdder
    port map( 
        A => A(1),
        B => B(1),
        cin => carry(0), 
        S => S(1),
        cout => carry(1)
    );
    
    Bit2 : FullAdder
    port map( 
        A => A(2),
        B => B(2),
        cin => carry(1), 
        S => S(2),
        cout => carry(2)
    );
    
    Bit3 : FullAdder
    port map( 
        A => A(3),
        B => B(3),
        cin => carry(2), 
        S => S(3),
        cout => cout
    );

end Structural;