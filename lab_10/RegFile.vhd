library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity RegisterFile is
    port(
        clk    : in std_logic; -- positive edge triggered clock
        clear  : in std_logic; -- asynchronous, active low reset
        
        a_addr : in std_logic_vector( 3 downto 0); -- register select for input a
        a_data : in std_logic_vector(15 downto 0); -- input data port
        load   : in std_logic;                     -- load enable/enable signal for "loading"
        
        b_addr : in std_logic_vector( 3 downto 0); -- register select for output b
        c_addr : in std_logic_vector( 3 downto 0); -- register select for output c
        
        b_data : out std_logic_vector(15 downto 0); -- first output data port
        c_data : out std_logic_vector(15 downto 0)  -- second output data port
    );
End RegisterFile;

architecture syn of RegisterFile is
    -- Define Register File array here
    type ram_type is array (15 downto 0) of std_logic_vector(15 downto 0);
    signal REG_FILE : ram_type;    
begin
    process(clk, load, clear)
    begin
        if (clear = '0') then
            REG_FILE(0)  <= x"0000";
            REG_FILE(1)  <= x"0001";
            REG_FILE(2)  <= x"0000";
            REG_FILE(3)  <= x"0000";
            
            REG_FILE(4)  <= x"0000";
            REG_FILE(5)  <= x"0000";
            REG_FILE(6)  <= x"0000";
            REG_FILE(7)  <= x"0000";
            
            REG_FILE(8)  <= x"0000";
            REG_FILE(9)  <= x"0000";
            REG_FILE(10) <= x"0000";
            REG_FILE(11) <= x"0000";
            
            REG_FILE(12) <= x"0000";
            REG_FILE(13) <= x"0000";
            REG_FILE(14) <= x"0000";
            REG_FILE(15) <= x"0000";
        elsif (clk'event and clk='1') then
            if (load = '1') then
                -- Register Write using a_addr and a_data
                REG_FILE(conv_integer(a_addr)) <= a_data;
            end if;
        end if;
        -- Set R0 and R1         
        REG_FILE(0) <= x"0000";
        REG_FILE(1) <= x"0001";
    end process;
    -- Register Read (B and C).
    b_data <= REG_FILE(conv_integer(b_addr));
    c_data <= REG_FILE(conv_integer(c_addr));
end syn;