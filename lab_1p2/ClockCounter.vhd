library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;


entity ClockCounter is
	port(
		clk : in std_logic;
        rst : in std_logic;
        en  : in std_logic;
        cout: out std_logic;
        S: out std_logic_vector(5 downto 0);
        M: out std_logic_vector(5 downto 0);
        H: out std_logic_vector(4 downto 0)
	);
end ClockCounter;

architecture Behavioral of ClockCounter is
    component Counter60
        port(
            clk : in std_logic;a
            rst : in std_logic;
            en  : in std_logic;
            fout: out std_logic_vector(5 downto 0);
            cout: out std_logic
        );
    end component;

    component Counter24
        port(
            clk : in std_logic;
            rst : in std_logic;
            en  : in std_logic;
            fout: out std_logic_vector(4 downto 0);
            cout: out std_logic
        );
    end component;

    signal sec_carry : std_logic;
    signal min_carry : std_logic;
    
begin
    sec_counter : Counter60
    port map(
        clk  => clk,
        rst  => rst,
        en   => en,
        fout => S,
        cout => sec_carry
    );

    min_counter : Counter60
    port map(
        clk  => clk,
        rst  => rst,
        en   => sec_carry,
        fout => M,
        cout => min_carry
    );


    hour_counter : Counter24
	port map(
		clk  => clk,
        rst  => rst,
        en   => sec_carry and min_carry,
        fout => H,
        cout => cout
    );
	
    
end Behavioral;