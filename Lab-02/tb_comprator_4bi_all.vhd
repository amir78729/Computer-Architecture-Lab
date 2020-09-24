--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:50:26 08/25/2020
-- Design Name:   
-- Module Name:   C:/Users/Asus/Desktop/Lab/Lab-02/tb_comprator_4bi_all.vhd
-- Project Name:  Lab-02
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comprator_4bit
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
 
ENTITY tb_comprator_4bi_all IS
END tb_comprator_4bi_all;
 
ARCHITECTURE behavior OF tb_comprator_4bi_all IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comprator_4bit
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         a_gt_b : OUT  std_logic;
         a_eq_b : OUT  std_logic;
         a_lt_b : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal a_gt_b : std_logic;
   signal a_eq_b : std_logic;
   signal a_lt_b : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	--constant num_cycles : integer := 16;
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comprator_4bit PORT MAP (
          A => A,
          B => B,
          a_gt_b => a_gt_b,
          a_eq_b => a_eq_b,
          a_lt_b => a_lt_b
        );
 
    b0: process
    begin		
	    wait for 1 ns;	
	    b(0) <= not b(0) ;
    end process;

    b1: process
    begin		
	    wait for 2 ns;	
        b(1) <= not b(1) ;
      end process;

    b2: process
     begin		
	    wait for 4 ns;	
        b(2) <= not b(2) ;
    end process;

    b3: process
    begin		
	    wait for 8 ns;	
        b(3) <= not b(3) ;
    end process;
    
    a0: process
    begin		
	    wait for 16 ns;	
	    a(0) <= not a(0) ;
    end process;

    a1: process
    begin		
	    wait for 32 ns;	
        a(1) <= not a(1) ;
      end process;

    a2: process
     begin		
	    wait for 64 ns;	
        a(2) <= not a(2) ;
    end process;

    a3: process
    begin		
	    wait for 128 ns;	
        a(3) <= not a(3) ;
    end process;
    
END;
