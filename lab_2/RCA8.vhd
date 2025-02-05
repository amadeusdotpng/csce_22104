----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2024 04:55:22 PM
-- Design Name: 
-- Module Name: RCA8 - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA8 is
    port(
        A, B : in std_logic_vector(7 downto 0);
        Cin : in std_logic;
        F : out std_logic_vector(7 downto 0)
    );
end RCA8;

component FA
port(
    a, b, cin : in std_logic;
    s, cout : out std_logic
);
end component;

architecture Structural of RCA8 is
    signal Carry : std_logic_vector(6 downto 0);
begin

FA0 : FA
port map( A(0), B(0), Cin, F(0), Carry(0) );

FA1 : FA
port map( A(1), B(1), Carry(0), F(1), Carry(1) );

FA2 : FA
port map( A(2), B(2), Carry(1), F(2), Carry(2) );

FA3 : FA
port map( A(3), B(3), Carry(2), F(3), Carry(3) );

FA4 : FA
port map( A(4), B(4), Carry(3), F(4), Carry(4) );

FA5 : FA
port map( A(5), B(5), Carry(4), F(5), Carry(5) );

FA6 : FA
port map( A(6), B(6), Carry(5), F(6), Carry(6) );

FA7 : FA
port map( A(7), B(7), Carry(6), F(7), open );

end Structural;
