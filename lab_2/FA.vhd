library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    port (
        A, B, Cin: in std_logic;
        S, Cout: out std_logic
    );
end FullAdder;

architecture Datapath of FullAdder is
    signal S_temp : std_logic;
begin
   S_temp <= A xor B;
   S <= S_temp xor Cin;
   Cout <= (A and B) or (S_temp and cin);
end Datapath;


entity GateAND is
    port(
        A : in std_logic;
        B : in std_logic;
        C : out std_logic
    );
end GateAND;

architecture Datapath of GateAND is
begin
    C <= A and B;
end Datapath;


entity GateOR is
    port(
        A : in std_logic;
        B : in std_logic;
        C : out std_logic
    );
end GateOR;

architecture Datapath of GateOR is
begin
    C <= A or B;
end Datapath;


entity GateXOR is
    port(
        A : in std_logic;
        B : in std_logic;
        C : out std_logic
    );
end GateXOR;

architecture Datapath of GateXOR is
begin
    C <= A xor B;
end Datapath;
