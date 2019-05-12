-- Timer_IOM
-- Version 1.0
-- Autores: Sebastián Parrado
--				Jelitza Varón
-- Contador de 8 bits usando un tff
-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY counter IS 
	PORT (	clk		:	IN		STD_LOGIC;
				rst		:	IN		STD_LOGIC;
				ena		:	IN		STD_LOGIC;
				q			:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY counter;
-------------------------------------------------------
ARCHITECTURE rtl OF counter IS
	SIGNAL 	q_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	ena2	:	STD_LOGIC;
	SIGNAL	ena3	:	STD_LOGIC;
	SIGNAL	ena4	:	STD_LOGIC;
	SIGNAL	ena5	:	STD_LOGIC;
	SIGNAL	ena6	:	STD_LOGIC;
	SIGNAL	ena7	:	STD_LOGIC;
BEGIN
	ena2 <= q_s(1) AND q_s(0);
	ena3 <= q_s(2) AND ena2;
	ena4 <= q_s(3) AND ena3;
	ena5 <= q_s(4) AND ena4;
	ena6 <= q_s(5) AND ena5;
	ena7 <= q_s(6) AND ena6;
-------------------------------------------------------
	q_8: PROCESS (clk,rst,ena)
	BEGIN
	IF (rst='1') THEN
		q_s <= "00000000";
	ELSIF (rising_edge(clk)) THEN
	-- q0
		IF (ena ='1') THEN
		q_s(0) <= NOT(q_s(0));
	-- q1
			IF (q_s(0) ='1') THEN
				q_s(1) <= NOT(q_s(1));
	-- q2
				IF (ena2 ='1') THEN
					q_s(2) <= NOT(q_s(2));
	-- q3
					IF (ena3 ='1') THEN
						q_s(3) <= NOT(q_s(3));
	-- q4
						IF (ena4 ='1') THEN
							q_s(4) <= NOT(q_s(4));
	-- q5
							IF (ena5 ='1') THEN
								q_s(5) <= NOT(q_s(5));
	-- q6
								IF (ena6 ='1') THEN
									q_s(6) <= NOT(q_s(6));
	-- q7
									IF(ena7='1') THEN
										q_s(7) <= NOT(q_s(7));
									END IF;
								END IF;
							END IF;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END IF;
	END PROCESS q_8;
	q <= q_s;
END ARCHITECTURE rtl;