--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/
-----------------------------------------------------------
---  Module Name: Async D Flop
---  Description: Asynchronous D Type Flip Flop
-----------------------------------------------------------
Library IEEE;
USE IEEE.Std_logic_1164.all;

entity d_flop is
	port (
		clk  : in  std_logic;
		rstn : in  std_logic;
		d    : in  std_logic;
		q    : out std_logic;
		qb   : out std_logic
	);
end d_flop;

architecture d_flop_arc of d_flop is
begin
	 process(clk,rstn)
	 begin 
      if(rstn='0') then 
   q <= '0';
	qb <= '1';
      elsif(rising_edge(clk)) then
   q <= d;
	qb <= not d;
  end if;      
 end process;  
end d_flop_arc; 
