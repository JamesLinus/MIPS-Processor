----------------------------------------------------------------------------------
-- Create Date:    15:59:10 03/06/2016  
-- Module Name:    ADDER_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY ADDER_32Bit IS
	PORT(
		addr : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		val  : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o    : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
	);
END ADDER_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF ADDER_32Bit IS
SIGNAL temp : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS(addr,val)
	BEGIN
		temp <= addr + val;
	END PROCESS;
	o <= temp;
END Behavioral;