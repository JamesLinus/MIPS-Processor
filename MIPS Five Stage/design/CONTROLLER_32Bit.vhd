----------------------------------------------------------------------------------
-- Create Date:    20:09:24 03/06/2016 
-- Module Name:    CONTROLLER_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY CONTROLLER_32Bit IS
	PORT(
		Op                : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		Func              : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		RegWrite          : OUT STD_LOGIC;
		MemToReg          : OUT STD_LOGIC;
		MemWrite          : OUT STD_LOGIC;
		ALUControl        : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		ALUSrc            : OUT STD_LOGIC;
		RegDst            : OUT STD_LOGIC;
		Branch            : OUT STD_LOGIC;
		DSize             : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		LoadControl       : OUT STD_LOGIC
	);
END CONTROLLER_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF CONTROLLER_32Bit IS
SIGNAL t_RegWrite, t_MemToReg, t_MemWrite, t_ALUSrc, t_RegDst, t_Branch,
       t_LoadControl : STD_LOGIC := '0';
SIGNAL t_DSize : STD_LOGIC_VECTOR(1 DOWNTO 0) := (OTHERS => '0');
SIGNAL t_ALUControl : STD_LOGIC_VECTOR(5 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (Func, Op)
	BEGIN
        -- R-TYPE Instructions
        ----------------------------
--		IF (Op = "000000") and (Func = "001000") THEN --JUMP REGISTER
--		ELSIF (Op = "000000") and ( (Func = "000000") OR (Func = "000010") OR (Func = "000011") )THEN --FOR SHIFTING
--		ELSIF (Op = "000000") and ( (Func = "000100") OR (Func = "000110") OR (Func = "000111") ) THEN --FOR SHIFTING
--		ELSIF (Op = "000000") and (Func = "001000") THEN --JUMP REGISTER
--		ELSIF  (Op = "000000") and (Func = "001001") THEN --JUMP AND LINK REGISTER
		IF(Op = "000000") THEN
			t_RegWrite          <= '1';
			t_MemToReg          <= '0';
			t_MemWrite          <= '0';
			t_ALUControl        <= Func;
			t_ALUSrc            <= '0';
			t_RegDst            <= '1';
			t_Branch            <= '0';
			t_DSize             <= "11";
			t_LoadControl       <= '0';
            
        -- J-TYPE Instructions
        ----------------------------
--		ELSIF (Op(5 DOWNTO 1) = "00001") THEN
--			IF (Op(0) = '0') THEN -- PC <= JUMP 
--			ELSE -- JUMPLINK
--			END IF;
--		ELSIF (Op(5 DOWNTO 1) = "00000") THEN 
--			IF (Op(0) = '0') THEN -- PC <= JUMPREGISTER
--			ELSE --JUMPLINK REGISTER
--			END IF;
	-- -- -- -- -- -- -- -- -- -- -- --- -
		      
        -- Coprocessor Instructions
        ----------------------------
		--ELSIF (Op(5 DOWNTO 2) = "0100") THEN
        
        -- I-Type Instructions
        ----------------------------
		ELSE
			IF (Op = "100011") THEN --lw
				t_RegWrite          <= '1';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';
			ELSIF (Op = "100000") THEN --lb
				t_RegWrite          <= '1';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "00";
				t_LoadControl       <= '0';	
			ELSIF (Op = "100100") THEN --lbu
				t_RegWrite          <= '1';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "00";
				t_LoadControl       <= '1';
			ELSIF (Op = "100001") THEN --lhw
				t_RegWrite          <= '1';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "01";
				t_LoadControl       <= '0';	
			ELSIF (Op = "101001") THEN --shw
				t_RegWrite          <= '1';
				t_MemToReg          <= '0'; -- dont care
				t_MemWrite          <= '1';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "01";
				t_LoadControl       <= '0';	
			ELSIF (Op = "100100") THEN --lwu
				t_RegWrite          <= '1';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "100101") THEN --lhu
				t_RegWrite          <= '1';
				t_MemToReg          <= '1';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "01";
				t_LoadControl       <= '0';	 		
			ELSIF (Op = "101000") THEN --sb
				t_RegWrite          <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '1';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "00";
				t_LoadControl       <= '0';	
			ELSIF (Op = "101011") THEN --sw
				t_RegWrite          <= '0';
				t_MemToReg          <= '1';
				t_MemWrite          <= '1';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "001010") THEN --slti
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "001011") THEN --sltiu
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= Func;
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "001000") THEN --addi
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '1';
				t_ALUControl        <= "100000";
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "001000") THEN --addiu
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "100001";
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "001000") THEN --andi
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "100100";
				t_ALUSrc            <= '1';
				t_RegDst            <= '1';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "001000") THEN --ori
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "100101";
				t_ALUSrc            <= '1';
				t_RegDst            <= '1';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "001000") THEN --xori
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "100110";
				t_ALUSrc            <= '1';
				t_RegDst            <= '1';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "011111") THEN --LUI
				t_RegWrite          <= '1';
				t_MemToReg          <= '0';
				t_MemWrite          <= '1';
				t_ALUControl        <= "100110";
				t_ALUSrc            <= '1';
				t_RegDst            <= '0';
				t_Branch            <= '0';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	 			
			ELSIF (Op = "000100") THEN -- BEQ
				t_RegWrite          <= '0';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "111100";
				t_ALUSrc            <= '0';
				t_RegDst            <= '0';
				t_Branch            <= '1';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "000101") THEN -- BNE 
				t_RegWrite          <= '0';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "111101";
				t_ALUSrc            <= '0';
				t_RegDst            <= '0';
				t_Branch            <= '1';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "000001") THEN -- BGEZ 
				t_RegWrite          <= '0';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "111001";
				t_ALUSrc            <= '0';
				t_RegDst            <= '0';
				t_Branch            <= '1';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "000110") THEN -- BLEZ 
				t_RegWrite          <= '0';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "111110";
				t_ALUSrc            <= '0';
				t_RegDst            <= '0';
				t_Branch            <= '1';
				t_DSize             <= "11";
				t_LoadControl       <= '0';	
			ELSIF (Op = "000111") THEN -- BGZ 
				t_RegWrite          <= '0';
				t_MemToReg          <= '0';
				t_MemWrite          <= '0';
				t_ALUControl        <= "111111";
				t_ALUSrc            <= '0';
				t_RegDst            <= '0';
				t_Branch            <= '1';
				t_DSize             <= "11";
				t_LoadControl       <= '0';				
			END IF;
       END IF;
	END PROCESS;
	RegWrite          <= t_RegWrite;
	MemToReg          <= t_MemToReg;
	MemWrite          <= t_MemWrite;
	ALUControl        <= t_ALUControl;
	ALUSrc            <= t_ALUSrc;
	RegDst            <= t_RegDst;
	Branch            <= t_Branch;
	DSize             <= t_DSize;
	LoadControl       <= t_LoadControl;
END Behavioral;