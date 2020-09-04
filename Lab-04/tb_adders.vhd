------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:tb_adders
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_adders IS
END tb_adders;
 
ARCHITECTURE behavior OF tb_adders IS  
    COMPONENT carry_ripple_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
	 COMPONENT carry_lookahead_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
	 COMPONENT carry_select_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal carry_ripple_adder_sum : std_logic_vector(3 downto 0);
   signal carry_ripple_adder_cout : std_logic;
   signal carry_lookahear_adder_sum : std_logic_vector(3 downto 0);
   signal carry_lookahear_adder_cout : std_logic;
   signal carry_select_adder_sum : std_logic_vector(3 downto 0);
   signal carry_select_adder_cout : std_logic;
   
BEGIN
	carry_pipple: carry_ripple_adder port map (
		A => A,
		B => B,
		cin => cin,
		S => carry_ripple_adder_sum,
		cout => carry_ripple_adder_cout
	);
	carry_lookahead: carry_lookahead_adder port map (
		A => A,
		B => B,
		cin => cin,
		S => carry_lookahear_adder_sum,
		cout => carry_lookahear_adder_cout
	);
	carry_select: carry_select_adder port map (
		A => A,
		B => B,
		cin => cin,
		S => carry_select_adder_sum,
		cout => carry_select_adder_cout
	);
	b0: process
		begin
			wait for 5ns;
		b(0) <=  not b(0);
	end process;
	b1: process
		begin
			wait for 10ns;
		b(1) <=  not b(1);
	end process;
	b2: process
		begin
			wait for 20ns;
		b(2) <=  not b(2);
	end process;
	b3: process
		begin
			wait for 40ns;
		b(3) <=  not b(3);
	end process;
	a0: process
		begin
			wait for 80ns;
		a(0) <=  not a(0);
	end process;
	a1: process
		begin
			wait for 160ns;
		a(1) <=  not a(1);
	end process;
	a2: process
		begin
			wait for 320ns;
		a(2) <=  not a(2);
	end process;
	a3: process
		begin
			wait for 640ns;
		a(3) <=  not a(3);
	end process;
	c_in: process
		begin
			wait for 1280ns;
		cin <=  not cin;
	end process;
	--after simulation re-run  for 1.56us to see all of possible numbers

END;
