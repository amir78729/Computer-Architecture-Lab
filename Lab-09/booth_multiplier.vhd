------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:booth_multiplier
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;
use ieee.numeric_std.ALL;


entity booth_multiplier is
	GENERIC (x : INTEGER := 5;
		 y : INTEGER := 5);
	port(
    A : IN std_logic_vector(x - 1 downto 0);
    B : IN std_logic_vector(y - 1 downto 0);
    P : OUT std_logic_vector(x + y - 3 downto 0)
  );  
end booth_multiplier;
architecture booth_multiplier_arc OF booth_multiplier IS
BEGIN	
	process(A, B)		
		CONSTANT X_ZEROS : std_logic_vector(x - 1 downto 0) := (others => '0');
		CONSTANT Y_ZEROS : std_logic_vector(y - 1 downto 0) := (others => '0');		
		VARIABLE a_t, s_t, t_p : std_logic_vector(x + y + 1 downto 0);
		VARIABLE ab      : std_logic_vector(x - 1 downto 0);	
	BEGIN		
		a_t := (others => '0');
		s_t := (others => '0');
		t_p := (others => '0');		
		if (A /= X_ZEROS and B /= Y_ZEROS) then			
			a_t(x + y downto y + 1) := A;
			a_t(x + y + 1) := A(x - 1);	
			ab := (not A) + 1;	
			s_t(x + y downto y + 1) := ab;
			s_t(x + y + 1) := not(A(x - 1));		
			t_p(y downto 1) := B;			
			for i in 1 to y loop
				if (t_p(1 downto 0) = "01") then
					t_p := t_p + a_t;
				elsif (t_p(1 downto 0) = "10") then
					t_p := t_p + s_t;
				end if;
				-- Shift Right Arithmetic
				t_p := to_stdlogicvector(to_bitvector(t_p) sra 1);
				
			end loop;	
		end if;	
		P <= t_p((x + y)-2 downto 1);	
	end process;	
end booth_multiplier_arc;