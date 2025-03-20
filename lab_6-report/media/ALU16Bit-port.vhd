entity ALU16Bit is
    port(
        s : in std_logic_vector(1 downto 0);
        a : in std_logic_vector(15 downto 0);
        b : in std_logic_vector(15 downto 0);
        sout : out std_logic_vector(15 downto 0);
        cout : out std_logic
    );
end ALU16Bit;

