----------------------------------------------------------------------------------
-- Create Date:    15:56:55 03/06/2016  
-- Module Name:    PC_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY PC_32Bit IS
	PORT(
		clk     : IN std_logic;
		enable  : IN std_logic;
		addrIn  : IN std_logic_vector(31 DOWNTO 0);
		addrOut : OUT std_logic_vector(31 DOWNTO 0)
	);
END PC_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF PC_32Bit IS
SIGNAL data_addr  : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
BEGIN
	PROCESS (clk,enable)
	BEGIN
		IF (clk'EVENT AND clk = '1' AND enable = '0') THEN
			data_addr <= addrIn;
		END IF;
	END PROCESS;
	addrOut <= data_addr;
END Behavioral;