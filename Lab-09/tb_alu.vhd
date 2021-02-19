------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: tb_alu
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_alu IS
END tb_alu;
 
ARCHITECTURE behavior OF tb_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         temp_1 : IN  std_logic_vector(7 downto 0);
         temp_2 : IN  std_logic_vector(7 downto 0);
         op : IN  std_logic_vector(3 downto 0);
         clock : IN  std_logic;
         temp_3 : OUT  std_logic_vector(7 downto 0);
         carry : OUT  std_logic;
         DVF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal temp_1 : std_logic_vector(7 downto 0) := (others => '0');
   signal temp_2 : std_logic_vector(7 downto 0) := (others => '0');
   signal op : std_logic_vector(3 downto 0) := (others => '0');
   signal clock : std_logic := '0';

 	--Outputs
   signal temp_3 : std_logic_vector(7 downto 0);
   signal carry : std_logic;
   signal DVF : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   ALU_instance: ALU PORT MAP (
          temp_1 => temp_1,
          temp_2 => temp_2,
          op => op,
          clock => clock,
          temp_3 => temp_3,
          carry => carry,
          DVF => DVF
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '1';
		wait for clock_period/2;
		clock <= '0';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

		temp_1 <= "10101010";
		temp_2 <= "11101111";
		
		op <= "0000"; --xor
		
      wait for clock_period*2;
		
		op <= "0001"; --not temp 1
		
      wait for clock_period*2;
		
		op <= "0010"; --and
		
      wait for clock_period*2;
		
		op <= "0011"; --or
		
      wait for clock_period*2;
		
		op <= "0100"; --shl
		
      wait for clock_period*2;
		
		op <= "0101"; --shr
		
      wait for clock_period*2;
		
		op <= "0110"; --add
		
      wait for clock_period*2;
		
		op <= "0111"; --sub
		
      wait for clock_period*2;
		
		op <= "1000"; --mul
		
      wait for clock_period*2;
		
		op <= "1001"; --div
		
      wait for clock_period*2;
		
		op <= "1011"; --not defined
		
      wait for clock_period*2;

      --------------------------------------
		
		temp_1 <= "11010010";
		temp_2 <= "01001000";
		
		op <= "0000"; --xor
		
      wait for clock_period*2;
		
		op <= "0001"; --not temp 1
		
      wait for clock_period*2;
		
		op <= "0010"; --and
		
      wait for clock_period*2;
		
		op <= "0011"; --or
		
      wait for clock_period*2;
		
		op <= "0100"; --shl
		
      wait for clock_period*2;
		
		op <= "0101"; --shr
		
      wait for clock_period*2;
		
		op <= "0110"; --add
		
      wait for clock_period*2;
		
		op <= "0111"; --sub
		
      wait for clock_period*2;
		
		op <= "1000"; --mul
		
      wait for clock_period*2;
		
		op <= "1001"; --div
		
      wait for clock_period*2;
		
		op <= "1011"; --not defined
		
      wait for clock_period*2;
		
      --------------------------------------
		
		temp_1 <= "10101010";
		temp_2 <= "01010101";
		
		op <= "0000"; --xor
		
      wait for clock_period*2;
		
		op <= "0001"; --not temp 1
		
      wait for clock_period*2;
		
		op <= "0010"; --and
		
      wait for clock_period*2;
		
		op <= "0011"; --or
		
      wait for clock_period*2;
		
		op <= "0100"; --shl
		
      wait for clock_period*2;
		
		op <= "0101"; --shr
		
      wait for clock_period*2;
		
		op <= "0110"; --add
		
      wait for clock_period*2;
		
		op <= "0111"; --sub
		
      wait for clock_period*2;
		
		op <= "1000"; --mul
		
      wait for clock_period*2;
		
		op <= "1001"; --div
		
      wait for clock_period*2;
		
		op <= "1011"; --not defined
		
      wait for clock_period*2;

      --------------------------------------
		
		temp_1 <= "11010000";
		temp_2 <= "00001000";
		
		op <= "0000"; --xor
		
      wait for clock_period*2;
		
		op <= "0001"; --not temp 1
		
      wait for clock_period*2;
		
		op <= "0010"; --and
		
      wait for clock_period*2;
		
		op <= "0011"; --or
		
      wait for clock_period*2;
		
		op <= "0100"; --shl
		
      wait for clock_period*2;
		
		op <= "0101"; --shr
		
      wait for clock_period*2;
		
		op <= "0110"; --add
		
      wait for clock_period*2;
		
		op <= "0111"; --sub
		
      wait for clock_period*2;
		
		op <= "1000"; --mul
		
      wait for clock_period*2;
		
		op <= "1001"; --div
		
      wait for clock_period*2;
		
		op <= "1011"; --not defined
		
      wait for clock_period*2;
		
      --------------------------------------

      wait;
   end process;

END;
