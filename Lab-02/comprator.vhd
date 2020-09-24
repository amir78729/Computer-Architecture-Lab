------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: comprator
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity comprator  is
    port (
		a      : in  std_logic;
		b      : in  std_logic;
		g_t    : in  std_logic;
		e_q    : in  std_logic;
		l_t    : in  std_logic;
		a_gt_b : out std_logic;
		a_eq_b : out std_logic;
		a_lt_b : out std_logic
	);
end comprator ;

architecture comprator_arc of comprator  is
    component or_gate is
        Port(
            A, B: in std_logic;
            C   : out std_logic
        );
    End component or_gate;
	 
    component xnor_gate is
        Port(
            A, B: in std_logic;
            C   : out std_logic
        );
    End component xnor_gate;
	 
    component and_gate is
        Port(
            A, B: in std_logic;
            C   : out std_logic
        );
    End component and_gate;
	 
    signal internal_a_and_b_not, internal_a_not_and_b, internal_a_xnor_b, internal_eq_gt, internal_eq_lt: std_logic;
begin
    and_g_t: and_gate port map ( A => a, B => (not b), C => internal_a_and_b_not );
    and_l_t: and_gate port map ( A => (not a), B => b, C => internal_a_not_and_b );
    xnor_e_q: xnor_gate port map ( A => a, B => b, C => internal_a_xnor_b );
	 
    and_e_q_g_t: and_gate port map ( A => internal_a_xnor_b, B => g_t, C => internal_eq_gt );
    and_e_q_e_q: and_gate port map ( A => internal_a_xnor_b, B => e_q, C => a_eq_b );
    and_e_q_l_t: and_gate port map ( A => internal_a_xnor_b, B => l_t, C => internal_eq_lt );
    
    or_g_t: or_gate port map ( A => internal_a_and_b_not, B => internal_eq_gt, C => a_gt_b );
    or_l_t: or_gate port map ( A => internal_a_not_and_b, B => internal_eq_lt, C => a_lt_b );	 
end comprator_arc;

