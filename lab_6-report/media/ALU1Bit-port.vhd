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
