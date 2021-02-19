------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:carry_save_multiplier 
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity carry_save_multiplier  is
	port (
		A : in  std_logic_vector(3 downto 0);
		B : in  std_logic_vector(3 downto 0);
		P : out std_logic_vector(7 downto 0)
	);
end carry_save_multiplier ;
architecture carry_save_multiplier_arc of carry_save_multiplier  is
component full_adder is
	Port(
		a, b, cin: in std_logic;
		s, cout : out std_logic
	);
End component full_adder;
component half_adder is
	Port(
 		b, a: in std_logic;
 		s, cout : out std_logic
 	);
End component half_adder;

signal temp_s : std_logic_vector(5 downto 0);
signal temp_c : std_logic_vector(10 downto 0);

begin
	P(0) <= A(0) and B(0);
	-- half adders 
	HA0: half_adder port map(
		a    => A(0) and B(1),
		b    => A(1) and B(0),
		s    => P(1),
		cout => temp_c(0)
	);
	
	HA1: half_adder port map(
		a    => A(0) and B(2),
		b    => A(1) and B(1),
		s    => temp_s(0),
		cout => temp_c(1)
	);
	
	HA2: half_adder port map(
		a    => A(0) and B(3),
		b    => A(1) and B(2),
		s    => temp_s(1),
		cout => temp_c(2)
	);
	
	HA3: half_adder port map(
		a    => temp_c(6),
		b    => temp_s(4),
		s    => P(4),
		cout => temp_c(9)
	);
	-------------
	-- full adders
	FA0: full_adder port map(
		a    => temp_c(0),
		b    => temp_s(0),
		cin  => A(2) and B(0),
		s    => P(2),
		cout => temp_c(3)
	);
	
	FA1: full_adder port map(
		a    => temp_c(1),
		b    => temp_s(1),
		cin  => A(2) and B(1),
		s    => temp_s(2),
		cout => temp_c(4)
	);
	
	FA2: full_adder port map(
		a    => temp_c(2),
		b    => A(1) and B(3),
		cin  => A(2) and B(2),
		s    => temp_s(3),
		cout => temp_c(5)
	);
	
	FA3: full_adder port map(
		a    => temp_c(3),
		b    => temp_s(2),
		cin  => A(3) and B(0),
		s    => P(3),
		cout => temp_c(6)
	);
	
	FA4: full_adder port map(
		a    => temp_c(4),
		b    => temp_s(3),
		cin  => A(3) and B(1),
		s    => temp_s(4),
		cout => temp_c(7)
	);
	
	
	FA5: full_adder port map(
		a    => temp_c(5),
		b    => A(2) and B(3),
		cin  => A(3) and B(2),
		s    => temp_s(5),
		cout => temp_c(8)
	);
	
	FA6: full_adder port map(
		a    => temp_c(7),
		b    => temp_s(5),
		cin  => temp_c(9),
		s    => P(5),
		cout => temp_c(10)
	);
	
	FA7: full_adder port map(
		a    => temp_c(8),
		b    => A(3) and B(3),
		cin  => temp_c(10),
		s    => P(6),
		cout => P(7)
	);
	

end carry_save_multiplier_arc;

