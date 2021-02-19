--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/
-----------------------------------------------------------
---  Module Name: TB Ripple Counter
---  Description: Ripple Counter Testbench
-----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_ripple_counter IS
END tb_ripple_counter;
 
ARCHITECTURE behavior OF tb_ripple_counter IS 
    COMPONENT ripple_counter
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         count : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
   --Inputs
   signal clock : std_logic := '1';
   signal reset : std_logic := '0';
 	--Outputs
   signal count : std_logic_vector(3 downto 0);
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_counter PORT MAP (
          clock => clock,
          reset => reset,
          count => count
        );
   -- Clock process definitions
	c: process
    begin		
	    wait for 50 ns;	
	    clock <= not clock;
    end process;
   -- count to 7 (0111) and then resets to 0 and counts for ever again
   reset <= count(3);
END;