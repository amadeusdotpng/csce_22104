library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity CPU_2214 is
	port(
		clk	: in std_logic;
		clear : in std_logic;
		instruction : in std_logic_vector(15 downto 0)
 	);
end CPU_2214;

architecture Behavioral of CPU_2214 is
	COMPONENT ALU_16Bit
		port(	
		A		:	in		std_logic_vector(15 downto 0);
		B		:	in		std_logic_vector(15 downto 0);
		S		:	in		std_logic_vector(3 downto 0);
		Sout	:	out 	std_logic_vector(15 downto 0);
		Cout	:	out	std_logic
		);
	END COMPONENT;
	
	COMPONENT RegisterFile
	port(
		clk		:	in	 std_logic;		-- positive edge triggered clock
		clear	:	in  std_logic;		-- asynchronous reset
		
		a_addr	:	in	 std_logic_vector( 3 downto 0);	-- register select for input a
		a_data	:	in	 std_logic_vector(15 downto 0);	-- input data port
		load	:	in	 std_logic;					-- load enable/enable signal for "loading"
		
		b_addr:	in	 std_logic_vector( 3 downto 0); -- register select for output b
		c_addr:	in	 std_logic_vector( 3 downto 0); -- register select for output c
		
		b_data:	out std_logic_vector(15 downto 0);	-- first output data port
		c_data:	out std_logic_vector(15 downto 0)	-- second output data port
		);
	End COMPONENT;
	
	-- Signals
	signal cout			: std_logic;
	signal op 			: std_logic_vector(3 downto 0);
	signal rs			: std_logic_vector(3 downto 0);
	signal rt			: std_logic_vector(3 downto 0);
	signal rd			: std_logic_vector(3 downto 0);
	signal Sout_ALU		: std_logic_vector(15 downto 0);
	signal rs_data		: std_logic_vector(15 downto 0);
	signal rt_data		: std_logic_vector(15 downto 0);    

begin
	--------------------------------------------------------------------------
	-- Instruction Fetch
	--------------------------------------------------------------------------
	op <= instruction(15 downto 12);
    rd <= instruction(11 downto 8 );
    rs <= instruction( 7 downto 4 );
    rt <= instruction( 3 downto 0 );

	--------------------------------------------------------------------------
	-- Instruction Decode
	--------------------------------------------------------------------------
	CPU_Registers_0:		RegisterFile port map(
	-- your code
	clk		=> clk,
	clear	=> clear,

	a_addr	=> rd,
	a_data	=> Sout_ALU,
	load	=> '1',

	b_addr	=> rs,
	c_addr	=> rt,

	b_data	=> rs_data,
	c_data	=> rt_data
	);
	--------------------------------------------------------------------------
	-- Execute
	--------------------------------------------------------------------------
	CPU_ALU_0:				ALU_16Bit port map(
	-- your code
	A			=> rs_data,
	B			=> rt_data,
	S			=> op,
	Sout		=> Sout_ALU,
	Cout		=> cout
	);

	--------------------------------------------------------------------------
	-- Memory
	--------------------------------------------------------------------------

	-- Not for this Lab
	
	--------------------------------------------------------------------------
	-- Write Back
	--------------------------------------------------------------------------

	-- Not for this Lab

end Behavioral;

