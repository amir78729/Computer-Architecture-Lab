------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: half_adder
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity half_adder is
 	Port(
 		b, a: in std_logic;
 		s, cout : out std_logic
 	);
end entity half_adder;
architecture structure of half_adder is
component xor_gate is
	Port(
		A, B: in std_logic;
		C : out std_logic
	);
End component xor_gate;
component and_gate is
	Port(
		A, B: in std_logic;
		C : out std_logic
	);
End component and_gate;
begin 
	xor_gate_instance0: xor_gate port map ( A => b, B => a, C=>s );
 	and_gate_instance0: and_gate port map ( A => b, B => a, C=>cout );
end structure;