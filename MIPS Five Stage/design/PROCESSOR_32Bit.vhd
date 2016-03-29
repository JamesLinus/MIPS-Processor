----------------------------------------------------------------------------------
-- Create Date:    17:25:35 03/06/2016 
-- Module Name:    PROCESSOR_32Bit - Behavioral 
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- LIBRARIES / PACKAGES
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.PROCESSOR_PKG.ALL;
----------------------------------------------------------------------------------
-- ENTITY
----------------------------------------------------------------------------------
ENTITY PROCESSOR_32Bit IS
	PORT(
		ref_clk : IN std_logic;
		reset   : IN std_logic;
		-- Test Ports
		out_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_PCF : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_InstrF : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_PCPlus4F : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_InstrD : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_PCPlus4D : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_RegWriteD : OUT STD_LOGIC;
		out_MemtoRegD : OUT STD_LOGIC;
		out_MemWriteD : OUT STD_LOGIC;
		out_ALUControlD : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		out_ALUSrcD : OUT STD_LOGIC;
		out_RegDstD : OUT STD_LOGIC;
		out_BranchD : OUT STD_LOGIC;
		out_DSizeD : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		out_LoadControlD : OUT STD_LOGIC;
		out_RD1D : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_RD2D : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_SignImmD : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_RegWriteE : OUT STD_LOGIC;
		out_MemtoRegE : OUT STD_LOGIC;
		out_MemWriteE : OUT STD_LOGIC;
		out_ALUControlE : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		out_ALUSrcE : OUT STD_LOGIC;
		out_RegDstE : OUT STD_LOGIC;
		out_BranchE : OUT STD_LOGIC;
		out_DSizeE : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		out_LoadControlE : OUT STD_LOGIC;
		out_RD1E : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_RD2E : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_RsE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_RtE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_RdE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_SignImmE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_PCPlus4E : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_WriteRegE : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_SrcAE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_WriteDataE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_SrcBE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_SignImmShiftedE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_ZeroE : OUT STD_LOGIC;
		out_ALUOutE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_PCBranchE : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_RegWriteM : OUT STD_LOGIC;
		out_MemtoRegM : OUT STD_LOGIC;
		out_MemWriteM : OUT STD_LOGIC;
		out_BranchM : OUT STD_LOGIC;
		out_DSizeM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		out_LoadControlM : OUT STD_LOGIC;
		out_ZeroM : OUT STD_LOGIC;
		out_ALUOutM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_WriteDataM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_WriteRegM : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_PCBranchM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_PCSrcM : OUT STD_LOGIC;
		out_ReadDataM : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_RegWriteW : OUT STD_LOGIC;
		out_MemtoRegW : OUT STD_LOGIC;
		out_ReadDataW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_ALUOutW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_WriteRegW : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		out_ResultW : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		out_StallF : OUT STD_LOGIC;
		out_StallD : OUT STD_LOGIC;
		out_FlushE : OUT STD_LOGIC;
		out_ForwardAE : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		out_ForwardBE : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END PROCESSOR_32Bit;
----------------------------------------------------------------------------------
-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF PROCESSOR_32Bit IS
--WIRING HERE--
    -- Clock Signal
	 SIGNAL wClk : STD_LOGIC := '0';
	 -- Reset Signal
	 SIGNAL wRst : STD_LOGIC := '0';
	 -- Special Signals
	 SIGNAL wFour : STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000100"; -- 4
	 -- Common Signals
	 SIGNAL PC : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL PCF : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL InstrF : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL PCPlus4F : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL InstrD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL PCPlus4D : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL RegWriteD : STD_LOGIC;
	 SIGNAL MemtoRegD : STD_LOGIC;
	 SIGNAL MemWriteD : STD_LOGIC;
	 SIGNAL ALUControlD : STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL ALUSrcD : STD_LOGIC;
	 SIGNAL RegDstD : STD_LOGIC;
	 SIGNAL BranchD : STD_LOGIC;
	 SIGNAL DSizeD : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL LoadControlD : STD_LOGIC;
	 SIGNAL RD1D : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL RD2D : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL SignImmD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL RegWriteE : STD_LOGIC;
	 SIGNAL MemtoRegE : STD_LOGIC;
	 SIGNAL MemWriteE : STD_LOGIC;
	 SIGNAL ALUControlE : STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL ALUSrcE : STD_LOGIC;
	 SIGNAL RegDstE : STD_LOGIC;
	 SIGNAL BranchE : STD_LOGIC;
	 SIGNAL DSizeE : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL LoadControlE : STD_LOGIC;
	 SIGNAL RD1E : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL RD2E : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL RsE : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL RtE : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL RdE : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL SignImmE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL PCPlus4E : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL WriteRegE : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL SrcAE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL WriteDataE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL SrcBE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL SignImmShiftedE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL ZeroE : STD_LOGIC;
	 SIGNAL ALUOutE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL PCBranchE : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL RegWriteM : STD_LOGIC;
	 SIGNAL MemtoRegM : STD_LOGIC;
	 SIGNAL MemWriteM : STD_LOGIC;
	 SIGNAL BranchM : STD_LOGIC;
	 SIGNAL DSizeM : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL LoadControlM : STD_LOGIC;
	 SIGNAL ZeroM : STD_LOGIC;
	 SIGNAL ALUOutM : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL WriteDataM : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL WriteRegM : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL PCBranchM : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL PCSrcM : STD_LOGIC;
	 SIGNAL ReadDataM : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL RegWriteW : STD_LOGIC;
	 SIGNAL MemtoRegW : STD_LOGIC;
	 SIGNAL ReadDataW : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL ALUOutW : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL WriteRegW : STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL ResultW : STD_LOGIC_VECTOR(31 DOWNTO 0);
	 SIGNAL StallF : STD_LOGIC;
	 SIGNAL StallD : STD_LOGIC;
	 SIGNAL FlushE : STD_LOGIC;
	 SIGNAL ForwardAE : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL ForwardBE : STD_LOGIC_VECTOR(1 DOWNTO 0);
	 
BEGIN
--INSTANTIATIONS--
	
	-- Instantiate MUX_BranchM
	Inst_MUX_32Bit_BranchM: MUX_32Bit 
	PORT MAP(
		d0 => PCPlus4F,
		d1 => PCBranchM,
		sel => PCSrcM,
		o => PC
	);
	
	-- Instantiate PC
	Inst_PC_32Bit: PC_32Bit
	PORT MAP(
		clk => wClk,
		enable => StallF,
		addrIn => PC,
		addrOut => PCF
	);
	
	-- Instantiate ROM
	Inst_ROM_512x32Bit: ROM_512x32Bit 
	PORT MAP(
		addr => PCF,
		inst => InstrF
	);
	
	-- Instantiate ADDER_PC
	Inst_ADDER_32Bit_PC: ADDER_32Bit 
	PORT MAP(
		addr  => PCF,
		val => wFour,
		o   => PCPlus4F
	);
	
	-- Instantiate REGISTER_IFID
	Inst_REGISTER_IFID: REGISTER_IFID
	PORT MAP(
		clk => wClk,
		enable => StallD,
		instrIn => InstrF,
		instr4In => PCPlus4F,
		instrOut => InstrD,
		instr4Out => PCPlus4D
	 );
	
	-- Instantiate CONTROLLER 
	Inst_CONTROLLER_32Bit: CONTROLLER_32Bit 
	PORT MAP(
		Op => InstrD(31 DOWNTO 26),
		Func => InstrD(5 DOWNTO 0),
		RegWrite => RegWriteD,
		MemToReg => MemtoRegD,
		MemWrite => MemWriteD,
		ALUControl => ALUControlD,
		ALUSrc => ALUSrcD,
		RegDst => RegDstD,
		Branch => BranchD,
		DSize => DSizeD,
		LoadControl => LoadControlD
	);
	
	-- Instantiate REGISTER FILE
	Inst_REGFILE_32x32Bit: REGFILE_32x32Bit
	PORT MAP(
		clk => wClk,
		rst_s => wRst,
		we => RegWriteM,
		raddr_1 => InstrD(25 DOWNTO 21),
		raddr_2 => InstrD(20 DOWNTO 16),
		waddr => WriteRegW,
		rdata_1 => RD1D,
		rdata_2 => RD2D,
		wdata => ResultW
	);
	
	-- Instantiate Extend
	Inst_EXTEND_16to32Bit: EXTEND_16to32Bit
	PORT MAP(
		i => InstrD(15 DOWNTO 0),
		o => SignImmD
	);
	
	-- Instantiate REGISTER_IDEX 
	Inst_REGISTER_IDEX: REGISTER_IDEX 
	PORT MAP(
		clk => wClk,
		clear => FlushE,
		RegWriteIn => RegWriteD,
		MemToRegIn => MemtoRegD,
		MemWriteIn => MemWriteD,
		ALUControlIn => ALUControlD,
		ALUSrcIn => ALUSrcD,
		RegDstIn => RegDstD,
		BranchIn => BranchD,
		DSizeIn => DSizeD,
		LoadControlIn => LoadControlD,
		data1In => RD1D,
		data2In => RD2D,
		RsIn => InstrD(25 DOWNTO 21),
		RtIn => InstrD(20 DOWNTO 16),
		RdIn => InstrD(15 DOWNTO 11),
		SignImmIn => SignImmD,
		PCPlus4In => PCPlus4D,
		RegWriteOut => RegWriteE,
		MemToRegOut => MemtoRegE,
		MemWriteOut => MemWriteE,
		ALUControlOut => ALUControlE,
		ALUSrcOut => ALUSrcE,
		RegDstOut => RegDstE,
		BranchOut => BranchE,
		DSizeOut => DSizeE,
		LoadControlOut => LoadControlE,
		data1Out => RD1E,
		data2Out => RD2E,
		RsOut => RsE,
		RtOut => RtE,
		RdOut => RdE,
		SignImmOut => SignImmE,
		PCPlus4Out => PCPlus4E
	);
	
	-- Instantiate MUX_RegDstE
	Inst_MUX_5Bit_RegDstE: MUX_5Bit 
	PORT MAP(
		d0 => RtE,
		d1 => RdE,
		sel => RegDstE,
		o => WriteRegE
	); 
	
	-- Instantiate MUX3_ForwardAE
	Inst_MUX3_ForwardAE: MUX3_32Bit 
	PORT MAP(
		d0 => RD1E,
		d1 => ResultW,
		d2 => ALUOutM,
		sel => ForwardAE,
		o => SrcAE
	);

	-- Instantiate MUX3_ForwardBE
	Inst_MUX3_ForwardBE: MUX3_32Bit 
	PORT MAP(
		d0 => RD2E,
		d1 => ResultW,
		d2 => ALUOutM,
		sel => ForwardBE,
		o => WriteDataE
	);
	
	-- Instantiate MUX_ALUSrcE
	Inst_MUX_32Bit_ALUSrcE: MUX_32Bit 
	PORT MAP(
		d0 => WriteDataE,
		d1 => SignImmE,
		sel => ALUSrcE,
		o => SrcBE
	);
	
	-- Instantiate SHIFTLEFT2
	Inst_SHIFTLEFT2_32Bit: SHIFTLEFT2_32Bit 
	PORT MAP(
		i => SignImmE,
		o => SignImmShiftedE
	);
	
	-- Instantiate ALU
	Inst_ALU_32Bit: ALU_32Bit 
	PORT MAP(
		Func_in => ALUControlE,
		A_in => SrcAE,
		B_in => SrcBE,
		O_out => ALUOutE,
		Branch_out => ZeroE
	);
	
	-- Instantiate ADDER_SignImm
	Inst_ADDER_32Bit_SignImm: ADDER_32Bit 
	PORT MAP(
		addr  => SignImmShiftedE,
		val => PCPlus4E,
		o   => PCBranchE
	);
	
	-- Instantiate REGISTER_EXMEM 
	Inst_REGISTER_EXMEM: REGISTER_EXMEM 
	PORT MAP(
		clk => wClk,
		RegWriteIn => RegWriteE,
		MemToRegIn => MemtoRegE,
		MemWriteIn => MemWriteE,
		BranchIn => BranchE,
		DSizeIn => DSizeE,
		LoadControlIn => LoadControlE,
		ALUZeroIn => ZeroE,
		ALUIn => ALUOutE,
		WriteDataIn => WriteDataE,
		WriteRegIn => WriteRegE,
		PCBranchIn => PCBranchE,
		RegWriteOut => RegWriteM,
		MemToRegOut => MemtoRegM,
		MemWriteOut => MemWriteM,
		BranchOut => BranchM,
		DSizeOut => DSizeM,
		LoadControlOut => LoadControlM,
		ALUZeroOut => ZeroM,
		ALUOut => ALUOutM,
		WriteDataOut => WriteDataM,
		WriteRegOut => WriteRegM,
		PCBranchOut => PCBranchM
	);
	
	-- Instantiate AND_Branch
	Inst_AND_1Bit_Branch: AND_1Bit 
	PORT MAP(
		a => BranchM,
		b => ZeroM,
		o => PCSrcM
	);
	
	-- Instantiate RAM
	Inst_RAM_512x8Bit: RAM_512x8Bit
	PORT MAP(
		clk => wClk,
		dsize => DSizeM,
		sign => LoadControlM,
		we => MemWriteM,
		addr => ALUOutM,
		dataI => WriteDataM,
		dataO => ReadDataM
	);
	
	-- Instantiate REGISTER_EXMEM 
	Inst_REGISTER_MEMWB: REGISTER_MEMWB 
	PORT MAP(
		clk => wClk,
		RegWriteIn => RegWriteM,
		MemToRegIn => MemtoRegM,
		ReadDataIn => ReadDataM,
		ALUIn => ALUOutM,
		WriteRegIn => WriteRegM,
		RegWriteOut => RegWriteW,
		MemToRegOut => MemtoRegW,
		ReadDataOut => ReadDataW,
		ALUOut => ALUOutW,
		WriteRegOut => WriteRegW
	);
	
	-- Instantiate MUX_MemtoRegW
	Inst_MUX_32Bit_MemtoRegW: MUX_32Bit 
	PORT MAP(
		d0 => ALUOutW,
		d1 => ReadDataW,
		sel => MemtoRegW,
		o => ResultW
	);
	
	-- Instantiate HAZ_FWD
	Inst_HAZ_FWD_32Bit: HAZ_FWD_32Bit
	PORT MAP(
		WriteRegMIn => WriteRegM,
		RegWriteMIn => RegWriteM,
		WriteRegWIn => WriteRegW,
		RegWriteWIn => RegWriteW,
		RseIn => RsE,
		ForwardAEOut => ForwardAE,
		RtEIn => RtE,
		ForwardBEOut => ForwardBE,
		RsDIn => InstrD(25 DOWNTO 21),
		RtDIn => InstrD(20 DOWNTO 16),
		MemtoRegEIn => MemtoRegE,
		StallFOut => StallF,
		StallDOut => StallD,
		FlushEOut => FlushE
	);	
	
	wClk <= ref_clk;
	wRst <= reset;
	--Testing
	out_PC <= PC;
		out_PCF <= PCF;
		out_InstrF <= InstrF;
		out_PCPlus4F <= PCPlus4F;
		out_InstrD <= InstrD;
		out_PCPlus4D <= PCPlus4D;
		out_RegWriteD <= RegWriteD;
		out_MemtoRegD <= MemtoRegD;
		out_MemWriteD <= MemWriteD;
		out_ALUControlD <= ALUControlD;
		out_ALUSrcD <= ALUSrcD;
		out_RegDstD <= RegDstD;
		out_BranchD <= BranchD;
		out_DSizeD <= DSizeD;
		out_LoadControlD <= LoadControlD;
		out_RD1D <= RD1D;
		out_RD2D <= RD2D;
		out_SignImmD <= SignImmD;
		out_RegWriteE <= RegWriteE;
		out_MemtoRegE <= MemtoRegE;
		out_MemWriteE <= MemWriteE;
		out_ALUControlE <= ALUControlE;
		out_ALUSrcE <= ALUSrcE;
		out_RegDstE <= RegDstE;
		out_BranchE <= BranchE;
		out_DSizeE <= DSizeE;
		out_LoadControlE <= LoadControlE;
		out_RD1E <= RD1E;
		out_RD2E <= RD2E;
		out_RsE <= RsE;
		out_RtE <= RtE;
		out_RdE <= RdE;
		out_SignImmE <= SignImmE;
		out_PCPlus4E <= PCPlus4E;
		out_WriteRegE <= WriteRegE;
		out_SrcAE <= SrcAE;
		out_WriteDataE <= WriteDataE;
		out_SrcBE <= SrcBE;
		out_SignImmShiftedE <= SignImmShiftedE;
		out_ZeroE <= ZeroE;
		out_ALUOutE <= ALUOutE;
		out_PCBranchE <= PCBranchE;
		out_RegWriteM <= RegWriteM;
		out_MemtoRegM <= MemtoRegM;
		out_MemWriteM <= MemWriteM;
		out_BranchM <= BranchM;
		out_DSizeM <= DSizeM;
		out_LoadControlM <= LoadControlM;
		out_ZeroM <= ZeroM;
		out_ALUOutM <= ALUOutM;
		out_WriteDataM <= WriteDataM;
		out_WriteRegM <= WriteRegM;
		out_PCBranchM <= PCBranchM;
		out_PCSrcM <= PCSrcM;
		out_ReadDataM <= ReadDataM;
		out_RegWriteW <= RegWriteW;
		out_MemtoRegW <= MemtoRegW;
		out_ReadDataW <= ReadDataW;
		out_ALUOutW <= ALUOutW;
		out_WriteRegW <= WriteRegW;
		out_ResultW <= ResultW;
		out_StallF <= StallF;
		out_StallD <= StallD;
		out_FlushE <= FlushE;
		out_ForwardAE <= ForwardAE;
		out_ForwardBE <= ForwardBE;
END Behavioral;