------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: comprator_4bit
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comprator_4bit  is
	port (
		A      : in  std_logic_vector(3 downto 0);
		B      : in  std_logic_vector(3 downto 0);
		a_gt_b : out std_logic;
		a_eq_b : out std_logic;
		a_lt_b : out std_logic
	);
end comprator_4bit ;

architecture comprator_arc  of comprator_4bit  is
	component comprator  is
        port (
            a      : in  std_logic;
            b      : in  std_logic;
            g_t     : in  std_logic;
            e_q     : in  std_logic;
            l_t     : in  std_logic;
            a_gt_b : out std_logic;
            a_eq_b : out std_logic;
            a_lt_b : out std_logic
        );
    End component comprator ;

    signal wire_gt:std_logic_vector(2 downto 0);
    signal wire_eq:std_logic_vector(2 downto 0);
    signal wire_lt:std_logic_vector(2 downto 0);
	 
begin
    comparator_3: comprator  port map ( a => A(0), b => B(0), g_t => '0', e_q => '1', l_t => '0', a_gt_b => wire_gt(2), a_eq_b => wire_eq(2), a_lt_b => wire_lt(2) ); 
    comparator_2: comprator  port map ( a => A(1), b => B(1), g_t => wire_gt(2) , e_q => wire_eq(2), l_t => wire_lt(2), a_gt_b => wire_gt(1), a_eq_b => wire_eq(1), a_lt_b => wire_lt(1) ); 
    comparator_1: comprator  port map ( a => A(2), b => B(2), g_t => wire_gt(1) , e_q => wire_eq(1), l_t => wire_lt(1), a_gt_b => wire_gt(0), a_eq_b => wire_eq(0), a_lt_b => wire_lt(0) ); 
    comparator_0: comprator  port map ( a => A(3), b => B(3), g_t => wire_gt(0) , e_q => wire_eq(0), l_t => wire_lt(0), a_gt_b => a_gt_b, a_eq_b => a_eq_b, a_lt_b => a_lt_b ); 
end comprator_arc ;

