architecture Behavioral of CPU is
    -- Components
    ...
    -- Signals
    signal OP : std_logic_vector(3 downto 0);
    signal RS : std_logic_vector(3 downto 0);
    signal RT : std_logic_vector(3 downto 0);
    signal RD : std_logic_vector(3 downto 0);

    signal RegisterSource      : std_logic; -- new!
    signal RegisterDestination : std_logic; -- new!
    signal RegisterWrite       : std_logic; -- new!
    signal RSData              : std_logic_vector(15 downto 0);
    signal Register2Address    : std_logic_vector(3  downto 0); -- new!
    signal Register2Data       : std_logic_vector(15 downto 0); -- renamed!

    signal ALUSource : std_logic;
    signal ALUOP     : std_logic_vector(1 downto 0);
    signal ALUInput  : std_logic_vector(15 downto 0);
    signal ALUOutput : std_logic_vector(15 downto 0); -- renamed!
    signal cout      : std_logic;

    signal MemoryRead   : std_logic;                     -- new!
    signal MemoryWrite  : std_logic;                     -- new!
    signal MemoryOutput : std_logic_vector(15 downto 0); -- new!
    
    signal Immediate : std_logic_vector(15 downto 0);
    signal WriteBack : std_logic_vector(15 downto 0);    -- new!
begin
