--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_moore_1101_detector IS
END tb_moore_1101_detector;
 
ARCHITECTURE behavior OF tb_moore_1101_detector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT moore_detector
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         din : IN  std_logic;
         detect : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal din : std_logic := '0';

 	--Outputs
   signal detect : std_logic;

 
BEGIN
 
		-- Instantiate the Unit Under Test (UUT)
   uut: moore_detector PORT MAP (
          clk => clk,
          rst => rst,
          din => din,
          detect => detect
        );

	clk <= not clk after 10 ns;
	rst <= '1', '0' after 20 ns;
	din <= '0' , '0' after 20 ns ,'0' after 40 ns ,'1' after 60 ns ,'1' after 80 ns ,
    '0' after 100 ns ,'0' after 120 ns ,'1' after 140 ns ,'0' after 160 ns ,
    '1' after 180 ns ,'0' after 200 ns ,'1' after 220 ns ,'1' after 240 ns ,
    '1' after 260 ns ,'0' after 280 ns ,'1' after 300 ns ,'1' after 320 ns ;

 

END;
