------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: tb_comprator_4bit
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY tb_comprator_4bit IS
END tb_comprator_4bit;
ARCHITECTURE behavior OF tb_comprator_4bit IS 
    COMPONENT comprator_4bit
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         a_gt_b : OUT  std_logic;
         a_eq_b : OUT  std_logic;
         a_lt_b : OUT  std_logic
        );
    END COMPONENT;
	 	 
    signal a : std_logic_vector(3 downto 0) := (others => '0');
    signal b : std_logic_vector(3 downto 0) := (others => '0');
    signal a_gt_b : std_logic;
    signal a_eq_b : std_logic;
    signal a_lt_b : std_logic;
BEGIN
    uut: comprator_4bit PORT MAP (
        a => a,
        b => b,
        a_gt_b => a_gt_b,
        a_eq_b => a_eq_b,
        a_lt_b => a_lt_b
    );
	 
	 
	 
   a <= "1000", "0101" after 100 ns, "1001" after 200 ns, "0100" after 300 ns, "1100" after 400 ns, "0111" after 500 ns, "0000" after 600 ns, "0110" after 700 ns, "1011" after 800 ns, "1110" after 900 ns, "0000" after 1000 ns;
   b <= "0000", "0101" after 100 ns, "1010" after 200 ns, "0100" after 300 ns, "0011" after 400 ns, "0111" after 500 ns, "1000" after 600 ns, "0110" after 700 ns, "0100" after 800 ns, "1110" after 900 ns, "0001" after 1000 ns;
END;
