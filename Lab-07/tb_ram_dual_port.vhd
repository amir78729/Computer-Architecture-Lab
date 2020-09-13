--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:48:13 09/11/2020
-- Design Name:   
-- Module Name:   C:/Users/Asus/Desktop/Lab/7/Lab-07/tb_ram_dual_port.vhd
-- Project Name:  Lab-07
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram_dual_port
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
  
ENTITY tb_ram_dual_port IS
END tb_ram_dual_port;
 
ARCHITECTURE behavior OF tb_ram_dual_port IS 
 
    COMPONENT ram_dual_port
    PORT(
         rd : IN  std_logic;
         wr : IN  std_logic;
         reset : IN  std_logic;
         addr_rd : IN  std_logic_vector(3 downto 0);
         addr_wr : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         data : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal reset : std_logic := '0';
   signal addr_rd : std_logic_vector(3 downto 0) := (others => '0');
   signal addr_wr : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   Dual_Port_Random_Access_Memory: ram_dual_port PORT MAP (
          rd => rd,
          wr => wr,
          reset => reset,
          addr_rd => addr_rd,
          addr_wr => addr_wr,
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
		wr <= '0';
		rd <= '1';
		addr_rd <= "0101"; 
		--data: 0101
		
		wait for 2*clk_period;	
		
		wr <= '1';
		rd <= '0';
		addr_wr <= "0000";
		--mem(0000) : 0101
		
		wait for 2*clk_period;	
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr_rd <= "1111"; 
		--data: 1111
		
		wait for 2*clk_period;	
		
		wr <= '1';
		rd <= '0';
		addr_wr <= "0110";
		--mem(0110) : 1111
		
		wait for 2*clk_period;	
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr_rd <= "0000"; 
		--data: 0101
		
		wait for 2*clk_period;	
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr_rd <= "0110"; 
		--data: 1111
		
		wait;	
		
   end process;

END;
