LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ram IS
END tb_ram;
 
ARCHITECTURE behavior OF tb_ram IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram
    PORT(
         rd : IN  std_logic;
         wr : IN  std_logic;
         reset : IN  std_logic;
         addr : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         data : INOUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal reset : std_logic := '0';
   signal addr : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   Random_Access_Memory: ram PORT MAP (
          rd => rd,
          wr => wr,
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
      -- hold reset state for 100 ns.
		reset <= '0';
		
      wait for clk_period;
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr <= "1111";
		--data: 1111
		
		wait for 2*clk_period;	
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr <= "0000";
		--data: 0000
		
		wait for 2*clk_period;
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr <= "0110";
		--data: 0110
		
		wait for 2*clk_period;
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr <= "1101";
		--data: 1101
		
		wait for 2*clk_period;
		
		reset <= '1';
		wr <= '0';
		rd <= '1';
		addr <= "0101";
		--data: 0101
		
		wait for 2*clk_period;

		wr <= '1';
		rd <= '0';
		addr <= "1111";
		--mem(1111): 0101
		
		wait for 2*clk_period;

		wr <= '0';
		rd <= '1';
		addr <= "0000";	
		--data: 0000
		
		wait for 2*clk_period;	

		wr <= '1';
		rd <= '0';
		addr <= "1100";
		--mem(1100): 0000
		
		wait for 2*clk_period;

		wr <= '0';
		rd <= '1';
		addr <= "1111";
		--data: 0101
		
		wait for 2*clk_period;

		wr <= '0';
		rd <= '1';
		addr <= "1100";
		--data: 1100
		
		wait for 2*clk_period;

		wr <= '0';
		rd <= '1';
		addr <= "0110";
		--data: 0110
		
		wait for 2*clk_period;

		wr <= '1';
		rd <= '0';
		addr <= "1111";
		--mem(1111): 0110
		
		wait for 2*clk_period;

		wr <= '0';
		rd <= '1';
		addr <= "1111";
		--data: 0110
		
      wait;
   end process;

END;
