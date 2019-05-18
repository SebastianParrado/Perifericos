-- my_BiDir testbench
-- Autores: Sebastián Parrado
--				Jelitza Varón
-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY GPIO_tb IS
END ENTITY GPIO_tb;
-------------------------------------------------------
ARCHITECTURE testbench OF GPIO_tb IS
	SIGNAL clk_tb	:	STD_LOGIC := '0';
	SIGNAL PORT_OUT_tb, PORT_IN_tb 	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL PIN_INOUT_tb, dir_tb 	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL LEDS_tb 	:	STD_LOGIC_VECTOR(9 DOWNTO 0);
-------------------------------------------------------
BEGIN 
	DUT1: ENTITY work.GPIO
	PORT MAP (	clk 			=> clk_tb,
					dir 			=> dir_tb,
					PORT_OUT		=> PORT_OUT_tb,
					PORT_IN  	=> PORT_IN_tb,
					PIN_INOUT   => PIN_INOUT_tb,
					LEDS        => LEDS_tb);
		
	-- CLOCK GENERATION
	clk_tb <= NOT(clk_tb) AFTER 50 ns;
	
	-- TEST VECTORS	
	signal_generation: PROCESS
	BEGIN
	--Si ena=0 => PORT_OUT=>PIN_INOUT ; si ena=1 => PIN_INOUT=>PORT_IN
		-- TEST VECTOR 1
		dir_tb      <= "00000000";
		PORT_OUT_tb <= "00000110";
		WAIT FOR 500 ns;
		
		-- TEST VECTOR 2
		dir_tb      <= "11111111";
		WAIT FOR 500 ns;
	END PROCESS signal_generation;
END ARCHITECTURE testbench;