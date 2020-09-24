------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: xnor_gate
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
Entity xnor_gate is
    Port(
        A, B: in std_logic;
        C : out std_logic
    );
End entity xnor_gate;

Architecture gatelevel of xnor_gate is
Begin
    C <= A xnor B;
End gatelevel;