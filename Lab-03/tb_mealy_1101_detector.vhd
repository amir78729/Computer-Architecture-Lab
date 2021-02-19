--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_mealy_1101_detector IS
END tb_mealy_1101_detector;
 
ARCHITECTURE behavior OF tb_mealy_1101_detector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mealy_detector
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
   uut: mealy_detector PORT MAP (
          clk => clk,
          rst => rst,
          din => din,
          detect => detect
        );
		  
	clk <= not clk after 10 ns;
	rst <= '1', '0' after 20 ns;
	din <= '0' , '0' after 22 ns ,'0' after 42 ns ,'1' after 62 ns ,'1' after 82 ns ,
					'0' after 102 ns ,'0' after 122 ns ,'1' after 142 ns ,'0' after 162 ns ,
					'1' after 182 ns ,'0' after 202 ns ,'1' after 222 ns ,'1' after 242 ns ,
					'1' after 262 ns ,'0' after 282 ns ,'1' after 302 ns ,'1' after 322 ns ;


  
END;
