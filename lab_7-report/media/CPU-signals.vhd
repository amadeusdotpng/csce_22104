architecture Behavioral of CPU is
    ...
    signal OP : std_logic_vector(3 downto 0);

    signal RS : std_logic_vector(3 downto 0);
    signal RT : std_logic_vector(3 downto 0);
    signal RD : std_logic_vector(3 downto 0);
    signal RSData : std_logic_vector(15 downto 0);
    signal RTData : std_logic_vector(15 downto 0);    

    signal cout     : std_logic;
    signal Sout_ALU : std_logic_vector(15 downto 0);
begin
    ...
end Behavioral;

