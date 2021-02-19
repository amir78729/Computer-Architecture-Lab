--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/

-----------------------------------------------------------
---  Module Name: TB 1101 Detector
---  Description: TB Mealy and More 1101 Sequence Detector
-----------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


entity tb_mealy_moore_1101_detector is
end entity ;

architecture testbench of tb_mealy_moore_1101_detector is
	

component mealy_detector is 
	port(
	clk    : in  std_logic;
		rst    : in  std_logic;
		din    : in  std_logic;
		detect : out std_logic
	);
end component;

component moore_detector is 
		port (
		clk    : in  std_logic;
		rst    : in  std_logic;
		din    : in  std_logic;
		detect : out std_logic
	);
end component;


	---------------------------------------
	-- don't change signals names and type
	signal clk          : std_logic := '0' ;
	signal rst          : std_logic ;
	signal din          : std_logic ;
	signal detect_mealy : std_logic;
	signal detect_moore : std_logic;
	---------------------------------------

begin
mealy: mealy_detector port map ( 
	clk => clk ,
	rst => rst ,
	din => din ,
	detect => detect_mealy
);

moore: moore_detector port map(
	clk => clk ,
	rst => rst ,
	din => din ,
	detect => detect_moore
 );


	clk <= not clk after 10 ns;
	rst <= '1', '0' after 20 ns;
	din <= '0' , '0' after 22 ns ,'0' after 42 ns ,'1' after 62 ns ,'1' after 82 ns ,
					'0' after 102 ns ,'0' after 122 ns ,'1' after 142 ns ,'0' after 162 ns ,
					'1' after 182 ns ,'0' after 202 ns ,'1' after 222 ns ,'1' after 242 ns ,
					'1' after 262 ns ,'0' after 282 ns ,'1' after 302 ns ,'1' after 322 ns ;

end architecture testbench;