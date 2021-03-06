------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name:full_adder
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
entity full_adder is
 Port(
	a, b, cin: in std_logic;
	s, cout : out std_logic
 );
end entity full_adder;
architecture structure of full_adder is
component or_gate is
Port(
	A, B: in std_logic;
	C : out std_logic
);
End component or_gate;
component half_adder is
Port(
	b, a: in std_logic;
	s, cout : out std_logic
);
end component half_adder;
signal internal_signal0, internal_signal1, internal_signal2: std_logic;
begin
 half_adder_instance0: half_adder port map ( b => a, a => b, s => internal_signal0, cout =>internal_signal1);
 half_adder_instance1: half_adder port map ( b => internal_signal0, a => cin, s => s, cout =>internal_signal2);
 or_gate_instance0: or_gate port map ( A => internal_signal1, B => internal_signal2, C => cout );
end structure;