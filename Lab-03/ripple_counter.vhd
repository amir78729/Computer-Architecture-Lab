--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/

-----------------------------------------------------------
---  Module Name: Ripple Counter 
---  Description: 4 Bit Ripple Counter
-----------------------------------------------------------
Library IEEE;
USE IEEE.Std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ripple_counter is
	port (
		clock     : in  std_logic;
		reset     : in  std_logic;
		count : out std_logic_vector(3 downto 0)
	);
end ripple_counter;

architecture comprator_arc of ripple_counter is
component t_flop is
	port (
		clk : in  std_logic;
		rst : in  std_logic;
		t   : in  std_logic;
		q   : out std_logic;
		qb  : out std_logic
	);
end component t_flop;
signal S0,S1,S2,S3 :std_logic;
begin
	 TFF0: t_flop port map ( clk => clock, rst => reset, t => '1', q => count(0), qb => S0);
	 TFF1: t_flop port map ( clk => S0,    rst => reset, t => '1', q => count(1), qb => S1);
	 TFF2: t_flop port map ( clk => S1,    rst => reset, t => '1', q => count(2), qb => S2);
	 TFF3: t_flop port map ( clk => S2,    rst => reset, t => '1', q => count(3), qb => S3);  
end comprator_arc;