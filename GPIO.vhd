-- ***********************************************
-- **  PROYECTO PDUA                            **
-- **  Modulo: 	RAM                           **
-- **  Creacion:	Julio 07								**
-- **  Revisi�n:	Marzo 08								**
-- **  Por :		MGH-DIMENDEZ-CMUA-UNIANDES 	**
-- ***********************************************
-- Descripcion:
-- RAM (Buses de datos INdependientes IN-OUT)
--                       cs  
--                   _____|_
--            rw -->|       |
-- dir(direccion)-->|       |--> data_OUT
--       data_IN -->|_______|   
--        
-- ***********************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GPIO is
    Port ( clk		: IN 	  std_logic;									-- Reloj
           dir 	   	: IN 	  std_logic_vector(7 downto 0);	-- Direcciones. Entrada dada por el usuario
  			  PORT_OUT  	: IN	  std_logic_vector(7 downto 0);	--	Salida de la GPIO. Entrada al BiDir.
			  PORT_IN  		: OUT   std_logic_vector(7 downto 0);	--	Entrada a la GPIO. Salida del BiDir.
			  PIN_INOUT		: INOUT  std_logic_vector(7 downto 0); -- Entrada a la GPIO. Salida del Pin.
			  int_GPIO  	: OUT   std_logic;
			  LEDS   		: OUT   std_logic_vector(9 downto 0));
end GPIO;

architecture Behavioral of GPIO is
	SIGNAL DIR_PORT    :  std_logic_vector(7 downto 0);
	SIGNAL PORT_OUT_S  :  std_logic_vector(7 downto 0);
	SIGNAL PORT_IN_S   :  std_logic_vector(7 downto 0);
	SIGNAL PIN_IN_s, PIN_INOUT_S:  std_logic_vector(7 downto 0);
	SIGNAL int_s :  std_logic_vector(7 downto 0);
	SIGNAL int_GPIO_s :  std_logic;
BegIN
DIR_PORT <= dir;
PORT_OUT_S <= PORT_OUT;

--DIR_PORT <= "00000000";
--PORT_OUT_S <="01010101";


PORT_IN <= PORT_IN_S;

int_GPIO <= int_GPIO_s;
int_GPIO_s <= PORT_IN_s(7) OR PORT_IN_s(6) OR PORT_IN_s(5) OR PORT_IN_s(4) OR PORT_IN_s(3) OR PORT_IN_s(2) OR PORT_IN_s(1) OR PORT_IN_s(0);

process (int_GPIO_S)
begin 
  if(int_GPIO_s = '1') then
      LEDS(7 downto 0) <= PIN_INOUT;
	else
	   LEDS(9 downto 8) <= "00";
  end if;
end process;

	bi_dir_0: ENTITY WORK.my_BiDir
		PORT MAP(clk => clk,
					ena => DIR_PORT(0),
					A0  => PORT_OUT_S(0),
					A1  => PORT_IN_S(0),
					B   => PIN_INOUT(0));
	
	bi_dir_1: ENTITY WORK.my_BiDir
		PORT MAP(clk => clk,
					ena => DIR_PORT(1),
					A0  => PORT_OUT_S(1),
					A1  => PORT_IN_S(1),
					B   => PIN_INOUT(1));
								 
	bi_dir_2: ENTITY WORK.my_BiDir
		PORT MAP(clk => clk,
					ena => DIR_PORT(2),
					A0  => PORT_OUT_S(2),
					A1  => PORT_IN_S(2),
					B   => PIN_INOUT(2));
							 
	bi_dir_3: ENTITY WORK.my_BiDir
		PORT MAP(clk => clk,
					ena => DIR_PORT(3),
					A0  => PORT_OUT_S(3),
					A1  => PORT_IN_S(3),
					B   => PIN_INOUT(3));
							 
	bi_dir_4: ENTITY WORK.my_BiDir
		PORT MAP(clk => clk,
					ena => DIR_PORT(4),
					A0  => PORT_OUT_S(4),
					A1  => PORT_IN_S(4),
					B   => PIN_INOUT(4));
								 
	bi_dir_5: ENTITY WORK.my_BiDir
		PORT MAP(clk => clk,
					ena => DIR_PORT(5),
					A0  => PORT_OUT_S(5),
					A1  => PORT_IN_S(5),
					B   => PIN_INOUT(5));
								 
	bi_dir_6: ENTITY WORK.my_BiDir
		PORT MAP(clk => clk,
					ena => DIR_PORT(6),
					A0  => PORT_OUT_S(6),
					A1  => PORT_IN_S(6),
					B   => PIN_INOUT(6));
									 
	bi_dir_7: ENTITY WORK.my_BiDir
		PORT MAP( clk => clk,
					 ena => DIR_PORT(7),
					 A0  => PORT_OUT_S(7),
					 A1  => PORT_IN_S(7),
					 B   => PIN_INOUT(7));
end Behavioral;