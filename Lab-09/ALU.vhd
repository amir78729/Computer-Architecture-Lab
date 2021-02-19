------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: ALU
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity ALU is
    port (
        temp_1   : in std_logic_vector(7 downto 0);  -- input #1
        temp_2   : in std_logic_vector(7 downto 0);  -- input #2
        op       : in std_logic_vector(3 downto 0);  -- choose the operand
        clock    : in std_logic; -- clock
        temp_3   : out std_logic_vector(7 downto 0); -- output 1
        carry    : out std_logic; -- used for ADD and SUB
        DVF      : out std_logic -- used for DIV
    );
end ALU;

architecture ALU_arc of ALU is
	-- Component outputs
    signal MUL : std_logic_vector(7 downto 0);
	signal DIV : std_logic_vector(7 downto 0) ;
	signal overflow: std_logic;
	 
	component booth_multiplier is
		port (
			A : IN std_logic_vector(4 downto 0) ;
			B : IN std_logic_vector(4 downto 0) ;
			P : OUT std_logic_vector(7 downto 0)
		);
	end component;
	 
	component divisor is
		port (
			A  : in std_logic_vector(7 downto 0) ;
			B  : in std_logic_vector(3 downto 0) ;
			Q  : out std_logic_vector(3 downto 0);
			R  : out std_logic_vector(3 downto 0);
			DVF: out std_logic 
		);
	end component;
begin

		

	ALU_process: process(temp_2, temp_1, op, clock)
	--used for ADD and SUB
	variable a_signal     : std_logic_vector(8 downto 0);
    variable b_signal     : std_logic_vector(8 downto 0);
    variable c_signal     : std_logic_vector(8 downto 0);	
		
	begin
		-- a_signal = '0' & temp_1
		a_signal(8) := '0';
		a_signal(7 downto 0) := temp_1;
		-- b_signal = '0' & temp_2
		b_signal(8) := '0';
		b_signal(7 downto 0) := temp_2;
		
        if rising_edge(clock) then
            case op is
                when "0000" => -- XOR
                    temp_3 <= temp_1 xor temp_2;
							dvf <= '0';
							carry <= '0';
                    
                when "0001" => -- NOT (not A)
                    temp_3 <= not temp_1;
							dvf <= '0';
							carry <= '0';
                    
                when "0010" => -- AND
                    temp_3 <= temp_1 and temp_2;
							dvf <= '0';
							carry <= '0';
                    
                when "0011" => -- OR
                   	temp_3 <=  temp_1 or temp_2;
							dvf <= '0';
							carry <= '0';
                    
                when "0100" => -- SHL (shift input A to left once)
                    temp_3 <= to_stdlogicvector(to_bitvector(temp_1) sll 1);
							dvf <= '0';
							carry <= '0';
								 
                when "0101" => -- SHR (shift input A to right once)
							temp_3 <= to_stdlogicvector(to_bitvector(temp_1) srl 1);
							dvf <= '0';
							carry <= '0';
                   
                when "0110" => -- ADD
							c_signal := a_signal + b_signal;
							temp_3 <= c_signal(7 downto 0);
							carry <= c_signal(8);
							dvf <= '0';

                when "0111" => -- SUB
							c_signal := a_signal + ((not b_signal) + 1);
							carry <= c_signal(8);
							temp_3 <= c_signal(7 downto 0);
							dvf <= '0';
					 					 
                when "1000" => -- MUL
							temp_3 <= mul;
							dvf <= '0';
							carry <= '0';
							
                when "1001" => -- DIV
							temp_3 <= div;
							carry <= '0';
							dvf <= overflow;

                when others => -- UNKNOWN OP
							temp_3 <= "00000000";
							dvf <= '0';
							carry <= '0';

            end case;
        end if;
	end process;
	
	multiplier : booth_multiplier port map(
		a(4) => '0',
		a(3 downto 0) => temp_1(7 downto 4),
		b(4) => '0' ,
		b(3 downto 0) => temp_2(7 downto 4),
		p => mul
	);
	
	divider : divisor port map(
		a => temp_1,
		b => temp_2 (3 downto 0),
		q => div(7 downto 4),
		r => div(3 downto 0),
		dvf => overflow
	);

end ALU_arc;
