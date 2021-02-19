--/*
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
--*/
-----------------------------------------------------------
---  Module Name: Mealy 1101 Detector
---  Description: Mealy 1101 Sequence Detector
-----------------------------------------------------------
Library IEEE;
USE IEEE.Std_logic_1164.all;

entity mealy_detector is
	port (
		clk    : in  std_logic;
		rst    : in  std_logic;
		din    : in  std_logic;
		detect : out std_logic
	);
end mealy_detector;

architecture mealy_detector_arc of mealy_detector is
	type states is (s0, s1, s2, s3);
	signal state: states := s0; 
	signal next_state: states := s0;
begin
	syncronous_process : process (clk)
begin
	if rising_edge(clk) then
	if (rst = '1') then
	state <= s0;
	else
	state <= next_state;
	end if;
	end if;
	end process;
	
	next_state_and_output_decoder : process(state, din)
begin
--	detect <= '0'; 
	case (state) is 
	when s0 =>
	if (din = '1') then
	next_state <= s1;
	detect <= '0';
	else
	next_state <= s0;
	detect <= '0';
	end if;
	
	when s1 =>
	if (din = '1') then
	next_state <= s2;
	detect <= '0';
	else
	next_state <= s0;
	detect <= '0'; 
	end if; 
	
	when s2 =>
	if (din = '1') then
	next_state <= s2;
	detect <= '0';
	else
	next_state <= s3;
	detect <= '0'; 
	end if;
	
	when s3 =>
	if (din = '1') then
	next_state <= s1;
	detect <= '1';
	else
	next_state <= s0;
	detect <= '0'; 
	end if;
	
	when others =>
	next_state <= s0;
	detect <= '0';
	
	end case;
	end process;

	
end mealy_detector_arc;