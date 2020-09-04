------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: carry_ripple_adder
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity carry_ripple_adder is
	port (
		A    : in  std_logic_vector(3 downto 0);
		B    : in  std_logic_vector(3 downto 0);
		cin  : in  std_logic;
		S    : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
end carry_ripple_adder;

architecture carry_ripple_adder_arc of carry_ripple_adder is
component full_adder is
	Port(
		i0, i1, cin: in std_logic;
		s, cout : out std_logic
	);
End component full_adder;
signal temp: std_logic_vector(2 downto 0);

begin
	FA0: full_adder port map (
    i0   => A(0),
    i1   => B(0), 
    cin  => cin,
    s    => S(0), 
    cout => temp(0)
  );
  FA1: full_adder port map (
    i0   => A(1),
    i1   => B(1), 
    cin  => temp(0),
    s    => S(1), 
    cout => temp(1)
  );
  FA2: full_adder port map (
    i0   => A(2),
    i1   => B(2), 
    cin  => temp(1),
    s    => S(2), 
    cout => temp(2)
  );
  FA3: full_adder port map (
    i0   => A(3),
    i1   => B(3), 
    cin  => temp(2),
    s    => S(3), 
    cout => cout
  );
end carry_ripple_adder_arc;

