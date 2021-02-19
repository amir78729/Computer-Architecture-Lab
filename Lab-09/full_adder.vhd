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
	a , b, cin: in std_logic;
	s, cout : out std_logic
 );
end entity full_adder;
architecture structure of full_adder is


begin
	s <= a xor b xor cin;
	cout <= (a and b) or (cin and b) or (a and cin);
  
end structure;
