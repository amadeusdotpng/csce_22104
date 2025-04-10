architecture Behavioral of CPU is
    -- Components
    ...
    -- Signals
    signal OP : std_logic_vector(3 downto 0);

    signal RS : std_logic_vector(3 downto 0);
    signal RT : std_logic_vector(3 downto 0);
    signal RD : std_logic_vector(3 downto 0);
    signal RSData : std_logic_vector(15 downto 0);
    signal RTData : std_logic_vector(15 downto 0);    

    signal ALUSource : std_logic;                     -- new!
    signal ALUOP     : std_logic_vector(1 downto 0);  -- new!
    signal ALUInput  : std_logic_vector(15 downto 0); -- new!
    signal ALUSout   : std_logic_vector(15 downto 0);
    signal cout      : std_logic;

    signal Immediate : std_logic_vector(15 downto 0); -- new!
begin
    ... 
end Behavioral;
