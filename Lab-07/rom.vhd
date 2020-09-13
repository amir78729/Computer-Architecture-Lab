------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: rom
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity rom is
    generic (c : INTEGER := 4;
         w : INTEGER := 4);
    port (
        rd : in std_logic;
        --wr : in std_logic;
        reset : in std_logic; -- active low
        addr : in std_logic_vector(c-1 downto 0);
        clk : in std_logic; 
        data : inout std_logic_vector(w-1 downto 0)
    );
end rom;

architecture rom_arc of rom is

type mem2d is array (2**c- 1 downto 0) of std_logic_vector(w - 1 downto 0);
signal memory : mem2d;

signal temp: std_logic_vector(w-1 downto 0);
begin
    process(reset, rd, addr, data, memory, clk)
    begin
        if (reset = '0') then -- reset data (active low) 
            for row in 0 to 2**c-1 loop
                memory(row) <= std_logic_vector(to_unsigned(row, memory(row)'length));
            end loop;
		  elsif (clk'event and clk = '1') then
            if(rd = '1') then
                temp <= memory(to_integer(unsigned(addr)));
					 data <= temp;
					 
--            elsif(wr = '1') then
--					temp <= data;
--                memory(to_integer(unsigned(addr))) <= data;
            end if;
        end if;
    end process;
end rom_arc;

