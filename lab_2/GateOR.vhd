library IEEE;
use IEEE.std_logic_1164.all;

entity GateOR is
port(
	A : in std_logic;
    B : in std_logic;
    C : in std_logic;
    F : out std_logic
);
end GateOR;

architecture Datapath of GateOR is
begin
    F <= A or B or C;
end Datapath;
