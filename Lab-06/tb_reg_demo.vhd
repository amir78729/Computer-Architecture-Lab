------------------------------------------------------------
-- 9731096: Amirhossein Alibakhshi ( amir78729@aut.ac.ir )
-- 9731078: Negin HajiSobhani ( neginhsobhani@aut.ac.ir )
------------------------------------------------------------
--- Module Name:tb_reg_demo
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tb_reg_demo IS
END tb_reg_demo;

ARCHITECTURE behavior OF tb_reg_demo IS

-- Component Declaration for the Unit Under Test (UUT)

COMPONENT reg
PORT(
parallel_in : IN std_logic_vector(3 downto 0);
lr : IN std_logic_vector(1 downto 0);
load : IN std_logic;
reset : IN std_logic;
clk : IN std_logic;
reg_out : inOUT std_logic_vector(3 downto 0)
);
END COMPONENT;


--Inputs
signal parallel_in : std_logic_vector(3 downto 0) := (others => '0');
signal lr : std_logic_vector(1 downto 0) := (others => '0');
signal load : std_logic := '0';
signal reset : std_logic := '0';
signal clk : std_logic := '0';

--Outputs
signal reg_out : std_logic_vector(3 downto 0);

-- Clock period definitions
--constant clk_period : time := 10 ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
uut: reg PORT MAP (
parallel_in => parallel_in,
lr => lr,
load => load,
reset => reset,
clk => clk,
reg_out => reg_out
);

-- Clock process definitions
clk_process :process
begin
clk <= '0';
wait for 50ns;
clk <= '1';
wait for 50ns;
end process;


-- Stimulus process
stim_proc: process
begin
parallel_in <= "1101";
reset <= '0';
load <= '1';

wait for 100ns;
load <= '0';
lr <= "10";

wait for 400ns;
parallel_in <= "1010";
load <= '1';

wait for 100ns;
load <= '0';
lr <= "01";

wait for 400ns;
parallel_in <= "1011";
load <= '1';

wait for 100ns;
load <= '0';
lr <= "11";

wait for 400ns;
reset <= '1';

wait for 100ns;
parallel_in <= "1101";
reset <= '0';
load <= '1';

wait for 500ns;

end process;

END;