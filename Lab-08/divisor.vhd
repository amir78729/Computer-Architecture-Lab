  
------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: divisor
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity divisor is
  port (
  sign_a : in std_logic ;
  sign_b : in std_logic ;
  A : in std_logic_vector(7 downto 0) ;
  B : in std_logic_vector(3 downto 0) ;
  Q : out std_logic_vector(3 downto 0);
  R : out std_logic_vector(3 downto 0);
  DVF : out std_logic ;
  sign_q : out std_logic
  );
end divisor;


architecture Behavioral of divisor is

begin
division : process(A, B, sign_a, sign_b)

VARIABLE a_t: std_logic_vector(7 downto 0);
VARIABLE b_t: std_logic_vector(3 downto 0);

VARIABLE eaq: std_logic_vector(8 downto 0);

begin

	a_t := A; 
	b_t := B;
	
  sign_q <= sign_a xor sign_b;
  
  eaq(8) := '0';
  eaq(7 downto 4) := a_t(7 downto 4);
  eaq(3 downto 0) := a_t(3 downto 0);
  
  if(A(7 downto 4) < B) then
	  DVF <= '0';
		for i in 0 to 3 loop
		--shift
		eaq := to_stdlogicvector(to_bitvector(eaq) sll 1);

			if(eaq(8) = '1') then
			  eaq(7 downto 4) := eaq(7 downto 4) + (not(B) + 1);
			  eaq(0) := '1';  
		  else   -- eaq(8) = '0'
				if(eaq(7 downto 4) < B) then -- a < b			
					eaq(0) := '0';		
				else		
					-- EA = A + B' + 1
					eaq(7 downto 4) := eaq(7 downto 4) + (not(B) + 1);
	
					eaq(0) := '1';			
				end if;
		  end if;
		end loop;
		
		Q <= eaq(3 downto 0);
		R <= eaq(7 downto 4);

  else
		DVF <= '1'; --overflow
		Q <= "0000";
		R <= "0000";
  end if;

end process;

end Behavioral;