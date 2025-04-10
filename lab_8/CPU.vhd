library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU is
    port(
        clk         : in std_logic;
        clear       : in std_logic;
        instruction : in std_logic_vector(15 downto 0)
     );
end CPU;

architecture Behavioral of CPU is
    component ALU16Bit
    port(    
    	S : in std_logic_vector(1 downto 0);
        A : in std_logic_vector(15 downto 0);
        B : in std_logic_vector(15 downto 0);
        Sout : out std_logic_vector(15 downto 0);
        Cout : out std_logic
    );
    end component;
    
    component RegisterFile
    port(
        clk   : in std_logic; -- positive edge triggered clock
        clear : in std_logic; -- asynchronous reset
        
        a_addr : in std_logic_vector( 3 downto 0); -- register select for input a
        a_data : in std_logic_vector(15 downto 0); -- input data port
        load   : in std_logic;                     -- load enable/enable signal for "loading"
        
        b_addr : in std_logic_vector( 3 downto 0); -- register select for output b
        c_addr : in std_logic_vector( 3 downto 0); -- register select for output c
        
        b_data : out std_logic_vector(15 downto 0); -- first output data port
        c_data : out std_logic_vector(15 downto 0)  -- second output data port
    );
    end component;
    
    component Control
    port(
    	op           : in std_logic_vector(3 downto 0);
        ctrl_alu_op  : out std_logic_vector(1 downto 0);
        ctrl_alu_src : out std_logic
    );
    end component;
    
    component ImmExt
    port(
    	imm : in std_logic_vector(3 downto 0);
        ext : out std_logic_vector(15 downto 0)
    );
    end component;
    
    -- Signals
    signal OP : std_logic_vector(3 downto 0);

    signal RS : std_logic_vector(3 downto 0);
    signal RT : std_logic_vector(3 downto 0);
    signal RD : std_logic_vector(3 downto 0);
    signal RSData : std_logic_vector(15 downto 0);
    signal RTData : std_logic_vector(15 downto 0);    

    signal ALUSource : std_logic;
    signal ALUOP : std_logic_vector(1 downto 0);
    signal ALUInput  : std_logic_vector(15 downto 0);
    signal ALUSout : std_logic_vector(15 downto 0);
    signal cout    : std_logic;

    signal Immediate : std_logic_vector(15 downto 0);
begin
    -- Instruction Fetch
    OP <= instruction(15 downto 12);
    RD <= instruction(11 downto 8 );
    RS <= instruction( 7 downto 4 );
    RT <= instruction( 3 downto 0 );

    -- Instruction Decode
    ControlBlock : Control
    port map(
        op => OP,
        ctrl_alu_op => ALUOP,
        ctrl_alu_src => ALUSource
    );

    ImmediateExtension : ImmExt
    port map (
        imm => RT,
        ext => Immediate
    );

    CPU_Registers_0: RegisterFile
    port map(
        clk   => clk,
        clear => clear,

        a_addr => RD,
        a_data => ALUSout,
        load   => '1',

        b_addr => RS,
        c_addr => RT,

        b_data => RSData,
        c_data => RTData
    );

    ALUInput <= Immediate when ALUSource = '1' else RTData;

    -- Execute
    CPU_ALU_0: ALU16Bit
    port map(
        A => RSData,
        B => ALUInput,
        S => ALUOP,
        Sout => ALUSout,
        Cout => cout
    );
end Behavioral;
