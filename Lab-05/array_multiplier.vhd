------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:array_multiplier
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity array_multiplier is
	port (
		A : in  std_logic_vector(3 downto 0);
		B : in  std_logic_vector(3 downto 0);
		P : out std_logic_vector(7 downto 0)
	);
end array_multiplier;
architecture array_multiplier_arc of array_multiplier is
component carry_lookahead_adder is
	port (
		A    : in  std_logic_vector(3 downto 0);
		B    : in  std_logic_vector(3 downto 0);
		cin  : in  std_logic;
		S    : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
End component carry_lookahead_adder;
component and_gate is
	Port(
		A, B: in std_logic;
		C : out std_logic
	);
End component and_gate;
signal temp : std_logic_vector(22 downto 0);
begin
	--Gates:
	b0a0: and_gate port map (
		A => A(0),
		B => B(0),
		C => P(0)
	);
	b0a1: and_gate port map (
		A => A(1),
		B => B(0),
		C => temp(0)
	);
	b0a2: and_gate port map (
		A => A(2),
		B => B(0),
		C => temp(1)
	);
	b0a3: and_gate port map (
		A => A(3),
		B => B(0),
		C => temp(2)
	);
	b1a0: and_gate port map (
		A => A(0),
		B => B(1),
		C => temp(3)
	);
	b1a1: and_gate port map (
		A => A(1),
		B => B(1),
		C => temp(4)
	);
	b1a2: and_gate port map (
		A => A(2),
		B => B(1),
		C => temp(5)
	);
	b1a3: and_gate port map (
		A => A(3),
		B => B(1),
		C => temp(6)
	);
	b2a0: and_gate port map (
		A => A(0),
		B => B(2),
		C => temp(11)
	);
	b2a1: and_gate port map (
		A => A(1),
		B => B(2),
		C => temp(12)
	);
	b2a2: and_gate port map (
		A => A(2),
		B => B(2),
		C => temp(13)
	);
	b2a3: and_gate port map (
		A => A(3),
		B => B(2),
		C => temp(14)
	);
	b3a0: and_gate port map (
		A => A(0),
		B => B(3),
		C => temp(19)
	);
	b3a1: and_gate port map (
		A => A(1),
		B => B(3),
		C => temp(20)
	);
	b3a2: and_gate port map (
		A => A(2),
		B => B(3),
		C => temp(21)
	);
	b3a3: and_gate port map (
		A => A(3),
		B => B(3),
		C => temp(22)
	);
	--Adders:
	adder1: carry_lookahead_adder port map (
		A(0) => temp(0),
		A(1) => temp(1),
		A(2) => temp(2),
		A(3) => '0',
		B(0) => temp(3),
		B(1) => temp(4),
		B(2) => temp(5),
		B(3) => temp(6),
		cin  => '0',
		S(0) => P(1),
		S(1) => temp(7),
		S(2) => temp(8),
		S(3) => temp(9),
		cout => temp(10) 
	);
	adder2: carry_lookahead_adder port map (
		A(0) => temp(7),
		A(1) => temp(8),
		A(2) => temp(9),
		A(3) => temp(10),
		B(0) => temp(11),
		B(1) => temp(12),
		B(2) => temp(13),
		B(3) => temp(14),
		cin  => '0',
		S(0) => P(2),
		S(1) => temp(15),
		S(2) => temp(16),
		S(3) => temp(17),
		cout => temp(18) 
	);
	adder3: carry_lookahead_adder port map (
		A(0) => temp(15),
		A(1) => temp(16),
		A(2) => temp(17),
		A(3) => temp(18),
		B(0) => temp(19),
		B(1) => temp(20),
		B(2) => temp(21),
		B(3) => temp(22),
		cin  => '0',
		S(0) => P(3),
		S(1) => P(4),
		S(2) => P(5),
		S(3) => P(6),
		cout => P(7) 
	);
end array_multiplier_arc;

