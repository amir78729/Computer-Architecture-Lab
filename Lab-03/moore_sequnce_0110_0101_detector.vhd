----------------------------------------------------------------------------------
--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moore_overlapped_detector is
	port (
		clk    : in  std_logic;
		rst    : in  std_logic;
		din    : in  std_logic;
		detect : out std_logic
	);
end moore_overlapped_detector;

architecture moore_overlapped_detector_arc of moore_overlapped_detector is
	type states is (s0,s1,s2,s3,s4,s5,s6);
	signal state: states := s0; 
	signal next_state: states := s0;
	
begin
	synchronous_process: process (clk)
	begin
	if rising_edge(clk) then
	if (rst = '1') then
	state <= s0;
	else
	state <= next_state;
	end if;
	end if;
	end process;

	output_decoder: process(state,din)
		begin
			case state is 
				when s0 => 
					if (din='1') then 
						next_state <= s0;
					else 
						next_state <= s1;
					end if;
					
					when s1 => 
					if (din='1') then 
						next_state <= s2;
					else 
						next_state <= s1;
					end if;
					
					when s2 => 
					if (din='1') then 
						next_state <= s3;
					else 
						next_state <= s5;
					end if;
					
					when s3 => 
					if (din='1') then 
						next_state <= s0;
					else 
						next_state <= s4;
					end if;
					
					when s4 => 
					if (din='1') then 
						next_state <= s2;
					else 
						next_state <= s1;
					end if;
					
					when s5 => 
					if (din='1') then 
						next_state <= s6;
					else 
						next_state <= s1;
					end if;
					
					when s6 => 
					if (din='1') then 
						next_state <= s3;
					else 
						next_state <= s5;
					end if;
					
					when others =>
						next_state <= s0;
						
				end case;
				end process;
		
		next_state_decoder : process(state)
		begin
		case (state) is 
		when s0 =>
			detect <= '0'; 
		when s1 =>
			detect <= '0';
		when s2 =>
			detect <= '0'; 
		when s3 =>
			detect <= '0'; 
		when s4 =>
			detect <= '1';
			when s5 =>
			detect <= '0'; 
		when s6 =>
			detect <= '1';
		when others =>
			detect <= '0';
		end case;
		
		end process;
		
end moore_overlapped_detector_arc;

					
			
			
			
			
			