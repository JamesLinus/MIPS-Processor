----------------------------------------------------------------------------------
-- Create Date:    17:09:56 03/09/2016  
-- Module Name:    HAZ_FWD_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
entity HAZ_FWD_32Bit is
	PORT( 
		WriteRegMIn	 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		RegWriteMIn	 : IN STD_LOGIC;
		WriteRegWIn	 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		RegWriteWIn	 : IN STD_LOGIC;
		RsEIn  		 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ForwardAEOut : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		RtEIn			 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		ForwardBEOut : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		RsDIn			 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		RtDIn		    : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		MemtoRegEIn  : IN STD_LOGIC;
		StallFOut	 : OUT STD_LOGIC;
		StallDOut	 : OUT STD_LOGIC;
		FlushEOut	 : OUT STD_LOGIC
	);
end HAZ_FWD_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
architecture Behavioral of HAZ_FWD_32Bit is
	
	SIGNAL data_ForwardAE : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL data_ForwardBE : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
	SIGNAL data_lwstall	 : STD_LOGIC;
	
BEGIN
	PROCESS (RsEIn,RtEIn,WriteRegMIn,RegWriteMIn,WriteRegWIn,RegWriteWIn,RsDIn,RtDIn,MemtoRegEIn)
	BEGIN	
		if  ( (RsEIn /= "00000") AND (RsEIn = WriteRegMIn) AND (RegWriteMIn = '1') )  then
			data_ForwardAE <= "10";
		elsif ( (RsEIn /= "00000") AND (RsEIn = WriteRegWIn) AND (RegWriteWIn = '1') ) then
			data_ForwardAE <= "01";
		else
			data_ForwardAE <= "00";
		end if;
		
		if  ( (RtEIn /= "00000") AND (RtEIn = WriteRegMIn) AND (RegWriteMIn = '1') )  then
			data_ForwardBE <= "10";
		elsif ( (RtEIn /= "00000") AND (RtEIn = WriteRegWIn) AND (RegWriteWIn = '1') ) then
			data_ForwardBE <= "01";
		else
			data_ForwardBE <= "00";
		end if;

		if ( ((RsDIn=RtEIn) OR (RtDIn=RtEIn)) AND MemtoRegEIn = '1' ) then
			data_lwstall <= '1';
		else
			data_lwstall <= '0';
		end if;	
	END PROCESS;
	ForwardAEOut <= data_ForwardAE;
	ForwardBEOut <= data_ForwardBE;
	StallFOut	 <= data_lwstall;
	StallDOut	 <= data_lwstall;
	FlushEOut	 <= data_lwstall;
end Behavioral;