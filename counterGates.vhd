-- Timer_IOM
-- Versión 1.0
-- Autores: Sebastián Parrado
--				Jelitza Varón
-------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-------------------------------------
ENTITY counterGates IS
	PORT (	clk_T		:	IN 	STD_LOGIC; 
				rst_T 	: 	IN 	STD_LOGIC;
				ena_T 	:	IN 	STD_LOGIC;
				q_T 		:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END counterGates;
-------------------------------------
ARCHITECTURE gateLevel OF counterGates IS
	SIGNAL	q0		:	STD_LOGIC;
	SIGNAL	q1		:	STD_LOGIC;
	SIGNAL	q2		:	STD_LOGIC;
	SIGNAL	q3		:	STD_LOGIC;
	SIGNAL	q4		:	STD_LOGIC;
	SIGNAL	q5		:	STD_LOGIC;
	SIGNAL	q6		:	STD_LOGIC;
	SIGNAL	q7		:	STD_LOGIC;
	
	SIGNAL	d0		:	STD_LOGIC;
	SIGNAL	d1		:	STD_LOGIC;
	SIGNAL	d2		:	STD_LOGIC;
	SIGNAL	d3		:	STD_LOGIC;
	SIGNAL	d4		:	STD_LOGIC;
	SIGNAL	d5		:	STD_LOGIC;
	SIGNAL	d6		:	STD_LOGIC;
	SIGNAL	d7		:	STD_LOGIC;
	
	SIGNAL	ena2	:	STD_LOGIC;
	SIGNAL	ena3	:	STD_LOGIC;
	SIGNAL	ena4	:	STD_LOGIC;
	SIGNAL	ena5	:	STD_LOGIC;
	SIGNAL	ena6	:	STD_LOGIC;
	SIGNAL	ena7	:	STD_LOGIC;
	
BEGIN
	-- Data signal is q negated
	-- to obtain a flip-flop toggle
	d0 <=	NOT(q0);
	d1	<= NOT(q1);
	d2	<= NOT(q2);
	d3	<= NOT(q3);
	d4	<= NOT(q4);
	d5	<= NOT(q5);
	d6	<= NOT(q6);
	d7	<= NOT(q7);
	
	--Logic to obtain the enable signals
	ena2 <= q1 AND q0;
	ena3 <= q2 AND q1 AND q0;
	ena4 <= q3 AND q2 AND q1 AND q0;
	ena5 <= q4 AND q3 AND q2 AND q1 AND q0;
	ena6 <= q5 AND q4 AND q3 AND q2 AND q1 AND q0;
	ena7 <= q6 AND q5 AND q4 AND q3 AND q2 AND q1 AND q0;
	
	--Output concatenation
	q_T <= q7&q6&q5&q4&q3&q2&q1&q0;
	
	-- DFF instantiation
	bit0: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	ena_T,
					d 		=>	d0,
					q 		=>	q0);
	
	bit1: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	q0,
					d 		=>	d1,
					q 		=>	q1);
	
	bit2: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	ena2,
					d 		=>	d2,
					q 		=>	q2);
	
	bit3: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	ena3,
					d 		=>	d3,
					q 		=>	q3);
					
	bit4: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	ena4,
					d 		=>	d4,
					q 		=>	q4);
	
	bit5: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	ena5,
					d 		=>	d5,
					q 		=>	q5);
	
	bit6: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	ena6,
					d 		=>	d6,
					q 		=>	q6);

	bit7: ENTITY work.my_dff
	PORT MAP (	clk	=>	clk_T,
					rst 	=>	rst_T,
					ena 	=>	ena7,
					d 		=>	d7,
					q 		=>	q7);
END ARCHITECTURE;