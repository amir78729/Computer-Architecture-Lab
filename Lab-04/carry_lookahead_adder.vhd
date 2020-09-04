------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: carry_lookahead_adder
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity carry_lookahead_adder is
	port (
		A    : in  std_logic_vector(3 downto 0);
		B    : in  std_logic_vector(3 downto 0);
		cin  : in  std_logic;
		S    : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
end carry_lookahead_adder;

architecture carry_lookahead_adder_arc  of carry_lookahead_adder is
component full_adder is
	Port(
		i0, i1, cin: in std_logic;
		s, cout : out std_logic
	); 
End component full_adder;

signal G : std_logic_vector(3 downto 0); -- Generate
signal P : std_logic_vector(3 downto 0); -- Propagate
signal C : std_logic_vector(3 downto 0); -- Carry

begin
	-- Gi = Ai * Bi
   G(0) <= A(0) and B(0);
   G(1) <= A(1) and B(1);
   G(2) <= A(2) and B(2);
   G(3) <= A(3) and B(3); 
   -- Pi = Ai + Bi
   P(0) <= A(0) or B(0);
   P(1) <= A(1) or B(1);
   P(2) <= A(2) or B(2);
   P(3) <= A(3) or B(3);
   -- Ci+1 = Gi + (Pi * Ci)
   C(0) <= cin; 
   C(1) <= G(0) or (P(0) and C(0));
   C(2) <= G(1) or (P(1) and C(1));
   C(3) <= G(2) or (P(2) and C(2));
   cout <= G(3) or (P(3) and C(3));
	-- full adders
	FA0: full_adder port map (
    i0   => A(0),
    i1   => B(0), 
    cin  => C(0),
    s    => S(0), 
    cout => open
  );
  FA1: full_adder port map (
    i0   => A(1),
    i1   => B(1), 
    cin  => C(1),
    s    => S(1), 
    cout => open
  );
  FA2: full_adder port map (
    i0   => A(2),
    i1   => B(2), 
    cin  => C(2),
    s    => S(2), 
    cout => open
  );
  FA3: full_adder port map (
    i0   => A(3),
    i1   => B(3), 
    cin  => C(3),
    s    => S(3), 
    cout => open
  );
end carry_lookahead_adder_arc ;

