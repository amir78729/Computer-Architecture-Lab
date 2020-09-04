------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: carry_select_adder
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity carry_select_adder is
	port (
		A    : in  std_logic_vector(3 downto 0);
		B    : in  std_logic_vector(3 downto 0);
		cin  : in  std_logic;
		S    : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
end carry_select_adder;



architecture carry_select_adder_arc of carry_select_adder is
component full_adder is
  Port(
    i0, i1, cin: in std_logic;
    s, cout : out std_logic
  );
End component full_adder;

component mux2x1 is
  port (
    d1 : in  std_logic;
    d0 : in  std_logic;
    sel : in std_logic;
    o : out std_logic
  );
End component mux2x1;

signal S0 : std_logic_vector(3 downto 0); -- sum for cin = 0
signal S1 : std_logic_vector(3 downto 0); -- sum for cin = 1
signal C0 : std_logic_vector(3 downto 0); -- cout for cin = 0
signal C1 : std_logic_vector(3 downto 0); -- cout for cin = 1
signal temp : std_logic_vector(2 downto 0);

begin
  FA0_0: full_adder port map (
    i0   => A(0),
    i1   => B(0), 
    cin  => '0',
    s    => S0(0), 
    cout => C0(0)
  );
  FA0_1: full_adder port map (
    i0   => A(1),
    i1   => B(1), 
    cin  => '0',
    s    => S0(1), 
    cout => C0(1)
  );
  FA0_2: full_adder port map (
    i0   => A(2),
    i1   => B(2), 
    cin  => '0',
    s    => S0(2), 
    cout => C0(2)
  );
  FA0_3: full_adder port map (
    i0   => A(3),
    i1   => B(3), 
    cin  => '0',
    s    => S0(3), 
    cout => C0(3)
  );
  FA1_0: full_adder port map (
    i0   => A(0),
    i1   => B(0), 
    cin  => '1',
    s    => S1(0), 
    cout => C1(0)
  );
  FA1_1: full_adder port map (
    i0   => A(1),
    i1   => B(1), 
    cin  => '1',
    s    => S1(1), 
    cout => C1(1)
  );
  FA1_2: full_adder port map (
    i0   => A(2),
    i1   => B(2), 
    cin  => '1',
    s    => S1(2), 
    cout => C1(2)
  );
  FA1_3: full_adder port map (
    i0   => A(3),
    i1   => B(3), 
    cin  => '1',
    s    => S1(3), 
    cout => C1(3)
  );
  ----------------------------------------------------------
  mux_s_0: mux2x1 port map (
    d0  => S0(0),
    d1  => S1(0), 
    sel => cin,
    o   =>  S(0)
  );
  mux_c_0: mux2x1 port map (
    d0  => C0(0),
    d1  => C1(0), 
    sel => cin,
    o   =>  temp(0)
  );
  mux_s_1: mux2x1 port map (
    d0  => S0(1),
    d1  => S1(1), 
    sel => temp(0),
    o   =>  S(1)
  );
  mux_c_1: mux2x1 port map (
    d0  => C0(1),
    d1  => C1(1), 
    sel => temp(0),
    o   =>  temp(1)
  );
  mux_s_2: mux2x1 port map (
    d0  => S0(2),
    d1  => S1(2), 
    sel => temp(1),
    o   =>  S(2)
  );
  mux_c_2: mux2x1 port map (
    d0  => C0(2),
    d1  => C1(2), 
    sel => temp(1),
    o   =>  temp(2)
  );
  mux_s_3: mux2x1 port map (
    d0  => S0(3),
    d1  => S1(3), 
    sel => temp(2),
    o   =>  S(3)
  );
  mux_c_3: mux2x1 port map (
    d0  => C0(3),
    d1  => C1(3), 
    sel => temp(2),
    o   =>  cout
  );
end carry_select_adder_arc;

