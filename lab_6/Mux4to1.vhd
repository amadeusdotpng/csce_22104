library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4to1 is
    port(
        s: in std_logic_vector(1 downto 0);
        x: in std_logic;
        y: in std_logic;
        z: in std_logic;
        w: in std_logic;
        b: out std_logic
    );
end Mux4To1;

architecture Datapath of Mux4to1 is
	signal t : std_logic_vector(3 downto 0);
begin
	t(0) <= (not s(1)) and (not s(0)) and x;
    t(1) <= (not s(1)) and (    s(0)) and y;
    t(2) <= (    s(1)) and (not s(0)) and z;
    t(3) <= (    s(1)) and (    s(0)) and w;

	b <= t(0) or t(1) or t(2) or t(3);
end Datapath;
