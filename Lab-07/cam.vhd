------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: cam
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity cam is
    generic (c : INTEGER := 4;
         w : INTEGER := 4);
    port (
        rd : in std_logic;
        wr : in std_logic;
        reset : in std_logic; -- active low
        clk : in std_logic; 
        match : out std_logic; 
        data : in std_logic_vector(w-1 downto 0)
    );
end cam;

architecture cam_arc of cam is
type mem2d is array (2**c- 1 downto 0) of std_logic_vector(w - 1 downto 0);
signal memory : mem2d;
CONSTANT empty : std_logic_vector(w-1 downto 0) := (others => '-');
begin			
    process(reset, rd, wr, data, memory, clk)
    begin
        if (reset = '0') then -- reset data (active low)
            for row in 0 to 2**c-1 loop
					 memory(row) <= empty;			 
            end loop;
				match <= '0';
		  elsif (clk'event and clk = '1') then
            if(rd = '1') then
                match <= '0';
					 for row in 0 to 2**c-1 loop
						if (data = memory(row)) then
							match <= '1';
							exit;
						end if;
					 end loop;
            elsif(wr = '1') then
					for row in 0 to 2**c-1 loop
						if (data = memory(row)) then -- data is already in the memory.
							exit;
						elsif (empty = memory(row)) then -- the first empty space founded ---> write the data.
							memory(row) <= data;
							exit;
						end if;
					 end loop;
            end if;
        end if;
    end process;
end cam_arc;

