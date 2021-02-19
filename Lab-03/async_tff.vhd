--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/
-----------------------------------------------------------
---  Module Name: Async T Flop
---  Description: Asynchronous Toggle Flip Flop
-----------------------------------------------------------
Library IEEE;
USE IEEE.Std_logic_1164.all;

entity t_flop is
	port (
		clk : in  std_logic;
		rst : in  std_logic;
		t   : in  std_logic;
		q   : out std_logic;
		qb  : out std_logic
	);
end t_flop;

architecture t_flop_arc of t_flop is
begin
	 process(clk,rst,t)
	 variable t_signal : std_logic := '0';
	 begin 
      if(rst='1') then 
			t_signal := '0';
      elsif(rising_edge(clk)) then
			if(t='1') then 
			t_signal := not t_signal;
			end if;
  end if; 
	q <= t_signal;
	qb <= not t_signal;  
 end process; 
end t_flop_arc;