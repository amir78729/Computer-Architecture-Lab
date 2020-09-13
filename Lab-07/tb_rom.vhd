--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:21:51 09/11/2020
-- Design Name:   
-- Module Name:   C:/Users/Asus/Desktop/Lab/7/Lab-07/tb_rom.vhd
-- Project Name:  Lab-07
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rom
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
 
ENTITY tb_rom IS
END tb_rom;
 
ARCHITECTURE behavior OF tb_rom IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rom
    PORT(
         rd : IN  std_logic;
         reset : IN  std_logic;
         addr : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         data : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal reset : std_logic := '0';
   signal addr : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   Read_Only_Memory: rom PORT MAP (
          rd => rd,
          reset => reset,
          addr => addr,
          clk => clk,
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
		
      wait for clk_period;
		
		reset <= '1';
		rd <= '1';
		addr <= "0000";
		
		wait for 2*clk_period;	
		
		addr <= "0010";
		
		wait for 2*clk_period;	
		
		addr <= "0100";
		
		wait for 2*clk_period;	
		
		addr <= "0110";
		
		wait for 2*clk_period;	
		
		addr <= "1000";
		
		wait for 2*clk_period;	
		
		addr <= "1010";
		
		wait for 2*clk_period;	
		
		addr <= "1100";
		
		wait for 2*clk_period;	
		
		addr <= "1110";
		
		wait for 2*clk_period;	
		
		------------
		
		addr <= "0001";
		
		wait for 2*clk_period;	
		
		addr <= "0011";
		
		wait for 2*clk_period;	
		
		addr <= "0101";
		
		wait for 2*clk_period;	
		
		addr <= "0111";
		
		wait for 2*clk_period;	
		
		addr <= "1001";
		
		wait for 2*clk_period;	
		
		addr <= "1011";
	
		wait for 2*clk_period;	
		
		addr <= "1101";
		
		wait for 2*clk_period;	
		
		addr <= "1111";
		
		wait;	

   end process;

END;
