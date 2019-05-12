-- Timer_IOM testbench
-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY counter_tb IS 
END ENTITY counter_tb;
-------------------------------------------------------
ARCHITECTURE testbench OF counter_tb IS
	SIGNAL 	clk_tb	:	STD_LOGIC := '0';
	SIGNAL	rst_tb	:	STD_LOGIC := '1';
	SIGNAL	ena_tb	:	STD_LOGIC := '0';
	SIGNAL	q_tb		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
-------------------------------------------------------
BEGIN
	DUT1: ENTITY work.counterGates
	PORT MAP (	clk_T	=> clk_tb,
					rst_T	=> rst_tb,
					ena_T	=> ena_tb,
					q_T	=>	q_tb);
					
	DUT2: ENTITY work.counter
	PORT MAP (	clk	=> clk_tb,
					rst	=> rst_tb,
					ena	=> ena_tb,
					q		=>	q_tb);
	-- CLOCK GENERATION
	clk_tb <= NOT(clk_tb) AFTER 50 ns;
	
	-- TEST VECTORS
	rst_tb <= '0' AFTER 200 ns;
	
	ena_tb <= '1' AFTER 200 ns;
--	signal_generation: PROCESS
--	BEGIN
--	-- TEST VECTOR 1
--	rst_tb <= '1';
--	ena_tb <= '0';
--	WAIT FOR 200 ns;
--	-- TEST VECTOR 2
--	rst_tb <= '0';
--	ena_tb <= '1';
--	WAIT FOR 1800 ns;
--	-- TEST VECTOR 3
--	rst_tb <= '1';
--	ena_tb <= '0';
--	WAIT FOR 200 ns;
--END PROCESS;
END ARCHITECTURE;