--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:32:36 08/29/2020
-- Design Name:   
-- Module Name:   C:/Users/negin/Desktop/az/Lab_03/moore_overlapped_detector.vhd
-- Project Name:  Lab_03
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: moore_overlapped_detector
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY moore_overlapped_detector IS
END moore_overlapped_detector;
 
ARCHITECTURE behavior OF moore_overlapped_detector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT moore_overlapped_detector
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
   uut: moore_overlapped_detector PORT MAP (
          clk => clk,
          rst => rst,
          din => din,
          detect => detect
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;
	
	 clk <= not clk after 10 ns;
  rst <= '1', '0' after 5 ns;
  din <= '0' , '0' after 22 ns ,'0' after 42 ns ,'1' after 62 ns ,'0' after 82 ns ,
					'1' after 102 ns ,'0' after 122 ns ,'1' after 142 ns ,'1' after 162 ns ,
					'1' after 182 ns ,'0' after 202 ns ,'1' after 222 ns ,'1' after 242 ns ,
					'0' after 262 ns ,'1' after 282 ns ,'0' after 302 ns ,'1' after 322 ns ;

END;
