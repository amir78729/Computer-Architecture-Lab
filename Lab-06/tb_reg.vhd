------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:tb_reg
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_reg IS
END tb_reg;
 
ARCHITECTURE behavior OF tb_reg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg
		 PORT(
				parallel_in : IN  std_logic_vector(3 downto 0);
				lr : IN  std_logic_vector(1 downto 0);
				load : IN  std_logic;
				reset : IN  std_logic;
				clk : IN  std_logic;
				reg_out : inOUT  std_logic_vector(3 downto 0)
		  );
    END COMPONENT;
	 
	 COMPONENT clock_divider
		 port (
			clk,reset: in std_logic;
			clock_out: out std_logic
		);
    END COMPONENT;
    

   --Inputs
   signal parallel_in : std_logic_vector(3 downto 0) := (others => '0');
   signal lr : std_logic_vector(1 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
	
	signal clock_divided : std_logic := '0';

 	--Outputs
   signal reg_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   --constant clk_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   shift_reg: reg PORT MAP (
	 parallel_in => parallel_in,
	 lr => lr,
	 load => load,
	 reset => reset,
	 clk => clock_divided,
	 reg_out => reg_out
  );
		  
	clk_div: clock_divider port map (
		clk => clk,
		reset => '0',
		clock_out => clock_divided
	);

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for 0.0125us;
		clk <= '1';
		wait for 0.0125us;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
		--load data
		parallel_in <= "1101";
		reset <= '0';
		load <= '1';
		
		wait for 2000ms;
		
		--shift left
		load <= '0';
		lr <= "10";
		
		wait for 8000ms;
		
		--load data
		parallel_in <= "1010";
		load <= '1';
		
		wait for 2000ms;
		
		--shift right logical
		load <= '0';
		lr <= "01";
		
		wait for 8000ms;
		
		
		--load data
		parallel_in <= "1011";
		load <= '1';
		
		wait for 2000ms;
		
		--shif right arithmetic
		load <= '0';
		lr <= "11";
		
		wait for 8000ms;
		
		--reset data to "0000"
		reset <= '1';
		
		wait for 2000ms;
		
		--load data
		parallel_in <= "1101";
		reset <= '0';
		load <= '1';
		
		wait for 5000ms;
      
   end process;
END;
