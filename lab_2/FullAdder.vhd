library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
    port (
        A   : in std_logic;
        B   : in std_logic;
        cin : in std_logic;
        S    : out std_logic;
        cout : out std_logic
    );
end FullAdder;

architecture Datapath of FullAdder is
    component GateAND
    	port(
        	A : in std_logic;
            B : in std_logic;
            F : out std_logic
		);
    end component;
    component GateOR
    	port(
        	A : in std_logic;
            B : in std_logic;
	        C : in std_logic;
            F : out std_logic
		);
    end component;
    component GateXOR
    	port(
        	A : in std_logic;
            B : in std_logic;
            C : in std_logic;
            F : out std_logic
		);
    end component;
    signal AB_AND : std_logic;
    signal ACin_AND : std_logic;
    signal BCin_AND : std_logic;
begin
    A_AND_B : GateAND
    port map(
    	A => A,
        B => B,
      	F => AB_AND
    );
    
    A_AND_Cin : GateAND
    port map(
    	A => A,
        B => cin,
      	F => ACin_AND
    );
    
    B_AND_Cin : GateAND
    port map(
    	A => B,
        B => cin,
      	F => BCin_AND
    );
    
    sum : GateXOR
    port map(
    	A => A,
        B => B,
        C => cin,
        F=> S
    );
    
    carry : GateOR
    port map(
    	A => AB_AND,
        B => ACin_AND,
        C => BCin_AND,
        F => cout
    );
end Datapath;



