-- Conversor binario a siete segmentos en hexadecimal 
-- Autores: Sebastián Parrado
--				Jelitza Varón
-------------------------------------------------------
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
-------------------------------------------------------
ENTITY bin_to_sseg IS
	PORT (	A 				:	IN		STD_LOGIC_VECTOR(15 DOWNTO 0);
				Sseg0,Sseg1 :	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
				Sseg2,Sseg3	:	OUT   STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY bin_to_sseg;
-------------------------------------------------------
ARCHITECTURE rtl OF bin_to_sseg IS
	SIGNAL nibble0, nibble1	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL nibble2, nibble3	:	STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL A_s					:	STD_LOGIC_VECTOR(15 DOWNTO 0);
-------------------------------------------------------
BEGIN

	--	A_s <= "0000110010111000";

	nibble0 <= A_s(3 DOWNTO 0);
	nibble1 <= A_s(7 DOWNTO 4);
	nibble2 <= A_s(11 DOWNTO 8);
	nibble3 <= A_s(15 DOWNTO 12);

	WITH nibble0 SELECT
	Sseg0 <=	
		"1000000"	WHEN "0000",  
		"1111001"	WHEN "0001", 
		"0100100"	WHEN "0010",  
		"0100100"	WHEN "0011", 
		"0011001"	WHEN "0100",  
		"0010010"	WHEN "0101",  
		"0000010"	WHEN "0110",  
		"1111000"	WHEN "0111",   
		"0000000"	WHEN "1000",
		"0010000" 	WHEN "1001",
		"0001000"	WHEN "1010", --A
		"0000011"   WHEN "1011", --B
		"1000110"   WHEN "1100", --C
		"0100001"	WHEN "1101", --D
		"0000110"	WHEN "1110", --E
		"0000111"	WHEN OTHERS; --F
		
	WITH nibble1 SELECT	
	Sseg1 <=	
		"1000000"	WHEN "0000",  
		"1111001"	WHEN "0001", 
		"0100100"	WHEN "0010",  
		"0100100"	WHEN "0011", 
		"0011001"	WHEN "0100",  
		"0010010"	WHEN "0101",  
		"0000010"	WHEN "0110",  
		"1111000"	WHEN "0111",   
		"0000000"	WHEN "1000",
		"0010000" 	WHEN "1001",
		"0001000"	WHEN "1010", --A
		"0000011"   WHEN "1011", --B
		"1000110"   WHEN "1100", --C
		"0100001"	WHEN "1101", --D
		"0000110"	WHEN "1110", --E
		"0000111"	WHEN OTHERS; --F
		
	WITH nibble2 SELECT
	Sseg2 <=	
		"1000000"	WHEN "0000",  
		"1111001"	WHEN "0001", 
		"0100100"	WHEN "0010",  
		"0100100"	WHEN "0011", 
		"0011001"	WHEN "0100",  
		"0010010"	WHEN "0101",  
		"0000010"	WHEN "0110",  
		"1111000"	WHEN "0111",   
		"0000000"	WHEN "1000",
		"0010000" 	WHEN "1001",
		"0001000"	WHEN "1010", --A
		"0000011"   WHEN "1011", --B
		"1000110"   WHEN "1100", --C
		"0100001"	WHEN "1101", --D
		"0000110"	WHEN "1110", --E
		"0000111"	WHEN OTHERS; --F
		
			WITH nibble3 SELECT
	Sseg3 <=	
		"1000000"	WHEN "0000",  
		"1111001"	WHEN "0001", 
		"0100100"	WHEN "0010",  
		"0100100"	WHEN "0011", 
		"0011001"	WHEN "0100",  
		"0010010"	WHEN "0101",  
		"0000010"	WHEN "0110",  
		"1111000"	WHEN "0111",   
		"0000000"	WHEN "1000",
		"0010000" 	WHEN "1001",
		"0001000"	WHEN "1010", --A
		"0000011"   WHEN "1011", --B
		"1000110"   WHEN "1100", --C
		"0100001"	WHEN "1101", --D
		"0000110"	WHEN "1110", --E
		"0000111"	WHEN OTHERS; --F
	
	
	
END ARCHITECTURE rtl;