----------------------------------------------------------------------------------
-- Create Date:    15:53:04 03/09/2016 
-- Module Name:    MUX3_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY MUX3_32Bit IS
	PORT( 
		d0  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		d1  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		d2  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		sel : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		o   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END MUX3_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF MUX3_32Bit IS
SIGNAL val : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(sel, d0, d1, d2)
	BEGIN
		IF sel = "00" THEN
			val <= d0;
		ELSIF sel = "01" THEN
			val <= d1;
		ELSIF sel = "10" THEN
			val <= d2;
		END IF;
	END PROCESS;
	o <= val;
END Behavioral;