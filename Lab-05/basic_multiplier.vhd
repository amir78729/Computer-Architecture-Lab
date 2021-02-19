------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:basic_multiplier
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity basic_multiplier is
	port (
		A : in  std_logic_vector(3 downto 0);
		B : in  std_logic_vector(3 downto 0);
		P : out std_logic_vector(7 downto 0)
	);
end basic_multiplier;
architecture basic_multiplier_arc of basic_multiplier is
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
	HA0: half_adder port map(
		a    => A(0) and B(1),
		b    => A(1) and B(0),
		s    => P(1),
		cout => temp_c(0)
	);
	HA1: half_adder port map(
		a    => temp_c(2),
		b    => A(1) and B(3),
		s    => temp_s(2),
		cout => temp_c(3)
	);
	HA2: half_adder port map(
		a    => A(2) and B(0),
		b    => temp_s(0),
		s    => P(2),
		cout => temp_c(4)
	);
	HA3: half_adder port map(
		a    => A(3) and B(0),
		b    => temp_s(3),
		s    => P(3),
		cout => temp_c(8)
	);
	--------------
	FA0: full_adder port map(
		a    => A(0) and B(2),
		b    => A(1) and B(1),
		cin  => temp_c(0),
		s    => temp_s(0),
		cout => temp_c(1)
	);
	FA1: full_adder port map(
		a    => A(0) and B(3),
		b    => A(1) and B(2),
		cin  => temp_c(1),
		s    => temp_s(1),
		cout => temp_c(2)
	);
	FA2: full_adder port map(
		a    => A(2) and B(1),
		b    => temp_s(1),
		cin  => temp_c(4),
		s    => temp_s(3),
		cout => temp_c(5)
	);
	FA3: full_adder port map(
		a    => A(2) and B(2),
		b    => temp_s(2),
		cin  => temp_c(5),
		s    => temp_s(4),
		cout => temp_c(6)
	);
	FA4: full_adder port map(
		a    => A(2) and B(3),
		b    => temp_c(3),
		cin  => temp_c(6),
		s    => temp_s(5),
		cout => temp_c(7)
	);
	FA5: full_adder port map(
		a    => A(3) and B(1),
		b    => temp_s(4),
		cin  => temp_c(8),
		s    => P(4),
		cout => temp_c(9)
	);
	FA6: full_adder port map(
		a    => A(3) and B(2),
		b    => temp_s(5),
		cin  => temp_c(9),
		s    => P(5),
		cout => temp_c(10)
	);
	FA7: full_adder port map(
		a    => A(3) and B(3),
		b    => temp_c(7),
		cin  => temp_c(10),
		s    => P(6),
		cout => P(7)
	);
end basic_multiplier_arc;

