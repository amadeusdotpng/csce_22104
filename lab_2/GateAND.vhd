library IEEE;
use IEEE.std_logic_1164.all;

entity GateAND is
    port (
        A: in std_logic;
        B: in std_logic;
        F: out std_logic
    );
end GateAND;

architecture Datapath of GateAND is
begin
    F <= A and B;
end Datapath;