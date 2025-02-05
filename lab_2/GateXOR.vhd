library IEEE;
use IEEE.std_logic_1164.all;

entity GateXOR is
    port(
        A : in std_logic;
        B : in std_logic;
        C : in std_logic;
        F : out std_logic
    );
end GateXOR;

architecture Datapath of GateXOR is
begin
    F <= A xor B xor C;
end Datapath;