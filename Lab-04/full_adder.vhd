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
	i0, i1, cin: in std_logic;
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

signal i1_xor_i0: std_logic;
signal temp: std_logic_vector(3 downto 0);
-- s = a xor b xor cin
--cout = (a and b) or (cin and b) or (a and cin)
begin
  xor_1: xor_gate port map (
    A => i1,
    B => i0, 
    C => i1_xor_i0
  );
  xor_2: xor_gate port map (
    A => i1_xor_i0,
    B => cin, 
    C => s
  );
  and_1: and_gate port map (
    A => i1,
    B => i0, 
    C => temp(0)
  );
  and_2: and_gate port map (
    A => i1,
    B => cin, 
    C => temp(1)
  );
  and_3: and_gate port map (
    A => cin,
    B => i0, 
    C => temp(2)
  );
  or_1: or_gate port map (
    A => temp(1),
    B => temp(2), 
    C => temp(3)
  );
  or_2: or_gate port map (
    A => temp(0),
    B => temp(3), 
    C => cout
  );
end structure;
