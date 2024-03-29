----------------------------------------------------------------------------------
-- Create Date:    15:50:08 03/06/2016 
-- Module Name:    MUX_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY MUX_32Bit IS
	PORT( 
		d0  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		d1  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		sel : IN  STD_LOGIC;
		o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END MUX_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF MUX_32Bit IS
SIGNAL val : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(sel, d0, d1)
	BEGIN
		IF sel = '0' THEN
			val <= d0;
		ELSIF sel = '1' THEN
			val <= d1;
		END IF;
	END PROCESS;
	o <= val;
END Behavioral;