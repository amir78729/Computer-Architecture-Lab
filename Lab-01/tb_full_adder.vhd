    ------------------------------------------------------------
--   9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
--   9731078: Negin HajiSobhani  ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
---  Module Name: tb_full_adder
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_full_adder IS
END tb_full_adder;
 
ARCHITECTURE behavior OF tb_full_adder IS 
 
 
    COMPONENT full_adder
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';
   signal cin : std_logic := '0';
   signal s : std_logic;
   signal cout : std_logic;

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          i0 => i0,
          i1 => i1,
          cin => cin,
          s => s,
          cout => cout
        );


		i0 <= '0', '0' after 100ns, '0' after 200ns, '0' after 300ns, '1' after 400ns, '1' after 500ns, '1' after 600ns, '1' after 700ns, '1' after 800ns;
		i1 <= '0', '0' after 100ns, '1' after 200ns, '1' after 300ns, '0' after 400ns, '0' after 500ns, '1' after 600ns, '1' after 700ns, '1' after 800ns;
		cin<= '0', '1' after 100ns, '0' after 200ns, '1' after 300ns, '0' after 400ns, '1' after 500ns, '0' after 600ns, '1' after 700ns, '1' after 800ns;
	

END;
