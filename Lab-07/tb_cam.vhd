--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:08:22 09/11/2020
-- Design Name:   
-- Module Name:   C:/Users/Asus/Desktop/Lab/7/Lab-07/tb_cam.vhd
-- Project Name:  Lab-07
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cam
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_cam IS
END tb_cam;
 
ARCHITECTURE behavior OF tb_cam IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cam
    PORT(
         rd : IN  std_logic;
         wr : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         match : out  std_logic;
         data : in  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal match : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   Content_Addressable_Memory: cam PORT MAP (
          rd => rd,
          wr => wr,
          reset => reset,
          clk => clk,
          match => match,
          data => data
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	
      reset <= '0';
		--empty the memory
		
      wait for clk_period;
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		data <= "0101"; 
		--match: 0

      wait for clk_period;
		
		wr <= '1';
		rd <= '0';
		data <= "0000"; 
		--mem(0): 0000

      wait for clk_period;
		
		wr <= '0';
		rd <= '1';
		data <= "0000"; 
		--match: 1

      wait for clk_period;
		
		
		wr <= '1';
		rd <= '0';
		data <= "1111"; 
		--mem(1): 1111

      wait for clk_period;
		
		wr <= '0';
		rd <= '1';
		data <= "1111"; 
		--match: 1
		
		wait for clk_period;
		
		wr <= '0';
		rd <= '1';
		data <= "0101"; 
		--match: 0

      wait for clk_period;
		
		wr <= '0';
		rd <= '1';
		data <= "0000"; 
		--match: 1

      wait for clk_period;
		
		wr <= '1';
		rd <= '0';
		data <= "1111"; 
		--mem(1): 1111

      wait for clk_period;
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
