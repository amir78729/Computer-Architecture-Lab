------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: xor_gate
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
Entity xor_gate is
    Port(
        A, B: in std_logic;
        C : out std_logic
    );
End entity xor_gate;

Architecture gatelevel of xor_gate is
Begin
    C <= A xor B;
End gatelevel;