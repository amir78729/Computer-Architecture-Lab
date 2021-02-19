------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:tb_multiplier
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_multiplier IS
END tb_multiplier;
ARCHITECTURE behavior OF tb_multiplier IS 
    COMPONENT basic_multiplier
        PORT(
            A : IN  std_logic_vector(3 downto 0);
            B : IN  std_logic_vector(3 downto 0);
            P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    COMPONENT carry_save_multiplier
        PORT(
            A : IN  std_logic_vector(3 downto 0);
            B : IN  std_logic_vector(3 downto 0);
            P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    COMPONENT array_multiplier
        PORT(
            A : IN  std_logic_vector(3 downto 0);
            B : IN  std_logic_vector(3 downto 0);
            P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    COMPONENT booth_multiplier
        PORT(
            A : IN  std_logic_vector(3 downto 0);
            B : IN  std_logic_vector(3 downto 0);
            P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   --Inputs
    signal A : std_logic_vector(3 downto 0) := (others => '0');
    signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
    signal P_basic_multiplier : std_logic_vector(7 downto 0);
    signal P_carry_save_multiplier : std_logic_vector(7 downto 0);
    signal P_array_multiplier : std_logic_vector(7 downto 0);
    signal P_booth_multiplier : std_logic_vector(7 downto 0);
	
BEGIN
basic_m: basic_multiplier port map (
    A => A,
    B => B,
    P => P_basic_multiplier
);
carry_save_m: carry_save_multiplier port map (
    A => A,
    B => B,
    P => P_carry_save_multiplier
);
array_m: array_multiplier port map (
    A => A,
    B => B,
    P => P_array_multiplier
);
booth_m: booth_multiplier port map (
    A => A,
    B => B,
    P => P_booth_multiplier
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
	--after simulation re-run  for 1.56us to see all of possible numbers

END;
