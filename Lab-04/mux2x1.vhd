------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: mux2x1
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
	port (
		d1 : in  std_logic;
		d0 : in  std_logic;
		sel : in std_logic;
		o : out std_logic
	);
end mux2x1;

architecture mux_arc of mux2x1 is
begin
	o <= d1 when sel='1' else d0 when sel='0' else '-'; 
end mux_arc;

