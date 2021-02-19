------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: reg
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity reg is
	port(
		parallel_in: in std_logic_vector(3 downto 0);
		lr: in std_logic_vector(1 downto 0);
		load: in std_logic;
		reset: in std_logic;
		clk: in std_logic;
		reg_out: inout std_logic_vector(3 downto 0)
	);
end reg;

architecture parallel_in_arc of reg is
begin
synchronous_process: process (clk)
	begin
	if rising_edge(clk) then
		if (reset = '1') then -- reset and change the output to "0000"
			reg_out <= "0000";
		else
			if (load = '1') then -- load the parallel input
				reg_out <= parallel_in;

			else
				if (lr = "10") then --shift left logical/arithmetic
					reg_out(3 downto 1) <= reg_out(2 downto 0) ;
					reg_out(0) <= '0';
					
				elsif (lr = "01") then --shift right logical
					reg_out(2 downto 0) <= reg_out(3 downto 1) ;
					reg_out(3) <= '0';
					
				elsif (lr = "11") then --shift right arithmetic
					reg_out(2 downto 0) <= reg_out(3 downto 1) ;
				end if;
			end if;
		end if;
	end if;
end process;

end parallel_in_arc;

