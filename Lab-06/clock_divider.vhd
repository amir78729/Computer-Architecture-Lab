------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: clock_divider
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clock_divider is
	port (
		clk,reset: in std_logic;
		clock_out: out std_logic
	);
end clock_divider;
  
architecture clock_divider_arc of clock_divider is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
  
begin
  
process(clk,reset)
begin
	if(reset='1') then
		count<=1;
		tmp<='0';
	elsif(clk'event and clk='1') then
		count <= count + 1;
		--  toggle the output after 40000000 toggles of input clock
		-- (if the frequency of input clock is 40MHz ( period = 0.025us) 
		--  then toggle the output after 1s)
		if (count = 40000000) then
			tmp <= NOT tmp;
			count <= 1;
		end if;
	end if;
	clock_out <= tmp;
end process;

end clock_divider_arc;
