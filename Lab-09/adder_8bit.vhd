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
		A    : in  std_logic_vector(7 downto 0);
		B    : in  std_logic_vector(7 downto 0);
		cin  : in  std_logic;
		S    : out std_logic_vector(7 downto 0);
		cout : out std_logic
	);
end carry_ripple_adder;

architecture carry_ripple_adder_arc of carry_ripple_adder is
component full_adder is
	Port(
		a, b, cin: in std_logic;
		s, cout : out std_logic
	);
End component full_adder;
signal temp: std_logic_vector(6 downto 0);

begin
	FA0: full_adder port map (
    a   => A(0),
    b   => B(0), 
    cin  => cin,
    s    => S(0), 
    cout => temp(0)
  );
  FA1: full_adder port map (
    a   => A(1),
    b   => B(1), 
    cin  => temp(0),
    s    => S(1), 
    cout => temp(1)
  );
  FA2: full_adder port map (
    a   => A(2),
    b   => B(2), 
    cin  => temp(1),
    s    => S(2), 
    cout => temp(2)
  );
  FA3: full_adder port map (
    a   => A(3),
    b   => B(3), 
    cin  => temp(2),
    s    => S(3), 
    cout => temp(3)
  );
  FA4: full_adder port map (
    a   => A(4),
    b   => B(4), 
    cin  => temp(3),
    s    => S(4), 
    cout => temp(4)
  );
  FA5: full_adder port map (
    a   => A(5),
    b   => B(5), 
    cin  => temp(4),
    s    => S(5), 
    cout => temp(5)
  );
  FA6: full_adder port map (
    a   => A(6),
    b   => B(6), 
    cin  => temp(5),
    s    => S(6), 
    cout => temp(6)
  );
  FA7: full_adder port map (
    a   => A(7),
    b   => B(7), 
    cin  => temp(6),
    s    => S(7), 
    cout => cout
  );
end carry_ripple_adder_arc;

