--------------------------------------------------------------------------------
-- Create Date:   23:56:01 03/09/2016
-- Project Name:  Pipeline_MIPS
-- VHDL Test Bench Created by ISE for module: PROCESSOR_32Bit
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PROCESSOR_32Bit_tb IS
END PROCESSOR_32Bit_tb;
 
ARCHITECTURE behavior OF PROCESSOR_32Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PROCESSOR_32Bit
    PORT(
         ref_clk : IN  std_logic;
         reset : IN  std_logic;
         out_PC : OUT  std_logic_vector(31 downto 0);
         out_PCF : OUT  std_logic_vector(31 downto 0);
         out_InstrF : OUT  std_logic_vector(31 downto 0);
         out_PCPlus4F : OUT  std_logic_vector(31 downto 0);
         out_InstrD : OUT  std_logic_vector(31 downto 0);
         out_PCPlus4D : OUT  std_logic_vector(31 downto 0);
         out_RegWriteD : OUT  std_logic;
         out_MemtoRegD : OUT  std_logic;
         out_MemWriteD : OUT  std_logic;
         out_ALUControlD : OUT  std_logic_vector(5 downto 0);
         out_ALUSrcD : OUT  std_logic;
         out_RegDstD : OUT  std_logic;
         out_BranchD : OUT  std_logic;
         out_DSizeD : OUT  std_logic_vector(1 downto 0);
         out_LoadControlD : OUT  std_logic;
         out_RD1D : OUT  std_logic_vector(31 downto 0);
         out_RD2D : OUT  std_logic_vector(31 downto 0);
         out_SignImmD : OUT  std_logic_vector(31 downto 0);
         out_RegWriteE : OUT  std_logic;
         out_MemtoRegE : OUT  std_logic;
         out_MemWriteE : OUT  std_logic;
         out_ALUControlE : OUT  std_logic_vector(5 downto 0);
         out_ALUSrcE : OUT  std_logic;
         out_RegDstE : OUT  std_logic;
         out_BranchE : OUT  std_logic;
         out_DSizeE : OUT  std_logic_vector(1 downto 0);
         out_LoadControlE : OUT  std_logic;
         out_RD1E : OUT  std_logic_vector(31 downto 0);
         out_RD2E : OUT  std_logic_vector(31 downto 0);
         out_RsE : OUT  std_logic_vector(4 downto 0);
         out_RtE : OUT  std_logic_vector(4 downto 0);
         out_RdE : OUT  std_logic_vector(4 downto 0);
         out_SignImmE : OUT  std_logic_vector(31 downto 0);
         out_PCPlus4E : OUT  std_logic_vector(31 downto 0);
         out_WriteRegE : OUT  std_logic_vector(4 downto 0);
         out_SrcAE : OUT  std_logic_vector(31 downto 0);
         out_WriteDataE : OUT  std_logic_vector(31 downto 0);
         out_SrcBE : OUT  std_logic_vector(31 downto 0);
         out_SignImmShiftedE : OUT  std_logic_vector(31 downto 0);
         out_ZeroE : OUT  std_logic;
         out_ALUOutE : OUT  std_logic_vector(31 downto 0);
         out_PCBranchE : OUT  std_logic_vector(31 downto 0);
         out_RegWriteM : OUT  std_logic;
         out_MemtoRegM : OUT  std_logic;
         out_MemWriteM : OUT  std_logic;
         out_BranchM : OUT  std_logic;
         out_DSizeM : OUT  std_logic_vector(1 downto 0);
         out_LoadControlM : OUT  std_logic;
         out_ZeroM : OUT  std_logic;
         out_ALUOutM : OUT  std_logic_vector(31 downto 0);
         out_WriteDataM : OUT  std_logic_vector(31 downto 0);
         out_WriteRegM : OUT  std_logic_vector(4 downto 0);
         out_PCBranchM : OUT  std_logic_vector(31 downto 0);
         out_PCSrcM : OUT  std_logic;
         out_ReadDataM : OUT  std_logic_vector(31 downto 0);
         out_RegWriteW : OUT  std_logic;
         out_MemtoRegW : OUT  std_logic;
         out_ReadDataW : OUT  std_logic_vector(31 downto 0);
         out_ALUOutW : OUT  std_logic_vector(31 downto 0);
         out_WriteRegW : OUT  std_logic_vector(4 downto 0);
         out_ResultW : OUT  std_logic_vector(31 downto 0);
         out_StallF : OUT  std_logic;
         out_StallD : OUT  std_logic;
         out_FlushE : OUT  std_logic;
         out_ForwardAE : OUT  std_logic_vector(1 downto 0);
         out_ForwardBE : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ref_clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal out_PC : std_logic_vector(31 downto 0);
   signal out_PCF : std_logic_vector(31 downto 0);
   signal out_InstrF : std_logic_vector(31 downto 0);
   signal out_PCPlus4F : std_logic_vector(31 downto 0);
   signal out_InstrD : std_logic_vector(31 downto 0);
   signal out_PCPlus4D : std_logic_vector(31 downto 0);
   signal out_RegWriteD : std_logic;
   signal out_MemtoRegD : std_logic;
   signal out_MemWriteD : std_logic;
   signal out_ALUControlD : std_logic_vector(5 downto 0);
   signal out_ALUSrcD : std_logic;
   signal out_RegDstD : std_logic;
   signal out_BranchD : std_logic;
   signal out_DSizeD : std_logic_vector(1 downto 0);
   signal out_LoadControlD : std_logic;
   signal out_RD1D : std_logic_vector(31 downto 0);
   signal out_RD2D : std_logic_vector(31 downto 0);
   signal out_SignImmD : std_logic_vector(31 downto 0);
   signal out_RegWriteE : std_logic;
   signal out_MemtoRegE : std_logic;
   signal out_MemWriteE : std_logic;
   signal out_ALUControlE : std_logic_vector(5 downto 0);
   signal out_ALUSrcE : std_logic;
   signal out_RegDstE : std_logic;
   signal out_BranchE : std_logic;
   signal out_DSizeE : std_logic_vector(1 downto 0);
   signal out_LoadControlE : std_logic;
   signal out_RD1E : std_logic_vector(31 downto 0);
   signal out_RD2E : std_logic_vector(31 downto 0);
   signal out_RsE : std_logic_vector(4 downto 0);
   signal out_RtE : std_logic_vector(4 downto 0);
   signal out_RdE : std_logic_vector(4 downto 0);
   signal out_SignImmE : std_logic_vector(31 downto 0);
   signal out_PCPlus4E : std_logic_vector(31 downto 0);
   signal out_WriteRegE : std_logic_vector(4 downto 0);
   signal out_SrcAE : std_logic_vector(31 downto 0);
   signal out_WriteDataE : std_logic_vector(31 downto 0);
   signal out_SrcBE : std_logic_vector(31 downto 0);
   signal out_SignImmShiftedE : std_logic_vector(31 downto 0);
   signal out_ZeroE : std_logic;
   signal out_ALUOutE : std_logic_vector(31 downto 0);
   signal out_PCBranchE : std_logic_vector(31 downto 0);
   signal out_RegWriteM : std_logic;
   signal out_MemtoRegM : std_logic;
   signal out_MemWriteM : std_logic;
   signal out_BranchM : std_logic;
   signal out_DSizeM : std_logic_vector(1 downto 0);
   signal out_LoadControlM : std_logic;
   signal out_ZeroM : std_logic;
   signal out_ALUOutM : std_logic_vector(31 downto 0);
   signal out_WriteDataM : std_logic_vector(31 downto 0);
   signal out_WriteRegM : std_logic_vector(4 downto 0);
   signal out_PCBranchM : std_logic_vector(31 downto 0);
   signal out_PCSrcM : std_logic;
   signal out_ReadDataM : std_logic_vector(31 downto 0);
   signal out_RegWriteW : std_logic;
   signal out_MemtoRegW : std_logic;
   signal out_ReadDataW : std_logic_vector(31 downto 0);
   signal out_ALUOutW : std_logic_vector(31 downto 0);
   signal out_WriteRegW : std_logic_vector(4 downto 0);
   signal out_ResultW : std_logic_vector(31 downto 0);
   signal out_StallF : std_logic;
   signal out_StallD : std_logic;
   signal out_FlushE : std_logic;
   signal out_ForwardAE : std_logic_vector(1 downto 0);
   signal out_ForwardBE : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant ref_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PROCESSOR_32Bit PORT MAP (
          ref_clk => ref_clk,
          reset => reset,
          out_PC => out_PC,
          out_PCF => out_PCF,
          out_InstrF => out_InstrF,
          out_PCPlus4F => out_PCPlus4F,
          out_InstrD => out_InstrD,
          out_PCPlus4D => out_PCPlus4D,
          out_RegWriteD => out_RegWriteD,
          out_MemtoRegD => out_MemtoRegD,
          out_MemWriteD => out_MemWriteD,
          out_ALUControlD => out_ALUControlD,
          out_ALUSrcD => out_ALUSrcD,
          out_RegDstD => out_RegDstD,
          out_BranchD => out_BranchD,
          out_DSizeD => out_DSizeD,
          out_LoadControlD => out_LoadControlD,
          out_RD1D => out_RD1D,
          out_RD2D => out_RD2D,
          out_SignImmD => out_SignImmD,
          out_RegWriteE => out_RegWriteE,
          out_MemtoRegE => out_MemtoRegE,
          out_MemWriteE => out_MemWriteE,
          out_ALUControlE => out_ALUControlE,
          out_ALUSrcE => out_ALUSrcE,
          out_RegDstE => out_RegDstE,
          out_BranchE => out_BranchE,
          out_DSizeE => out_DSizeE,
          out_LoadControlE => out_LoadControlE,
          out_RD1E => out_RD1E,
          out_RD2E => out_RD2E,
          out_RsE => out_RsE,
          out_RtE => out_RtE,
          out_RdE => out_RdE,
          out_SignImmE => out_SignImmE,
          out_PCPlus4E => out_PCPlus4E,
          out_WriteRegE => out_WriteRegE,
          out_SrcAE => out_SrcAE,
          out_WriteDataE => out_WriteDataE,
          out_SrcBE => out_SrcBE,
          out_SignImmShiftedE => out_SignImmShiftedE,
          out_ZeroE => out_ZeroE,
          out_ALUOutE => out_ALUOutE,
          out_PCBranchE => out_PCBranchE,
          out_RegWriteM => out_RegWriteM,
          out_MemtoRegM => out_MemtoRegM,
          out_MemWriteM => out_MemWriteM,
          out_BranchM => out_BranchM,
          out_DSizeM => out_DSizeM,
          out_LoadControlM => out_LoadControlM,
          out_ZeroM => out_ZeroM,
          out_ALUOutM => out_ALUOutM,
          out_WriteDataM => out_WriteDataM,
          out_WriteRegM => out_WriteRegM,
          out_PCBranchM => out_PCBranchM,
          out_PCSrcM => out_PCSrcM,
          out_ReadDataM => out_ReadDataM,
          out_RegWriteW => out_RegWriteW,
          out_MemtoRegW => out_MemtoRegW,
          out_ReadDataW => out_ReadDataW,
          out_ALUOutW => out_ALUOutW,
          out_WriteRegW => out_WriteRegW,
          out_ResultW => out_ResultW,
          out_StallF => out_StallF,
          out_StallD => out_StallD,
          out_FlushE => out_FlushE,
          out_ForwardAE => out_ForwardAE,
          out_ForwardBE => out_ForwardBE
        );

   -- Clock process definitions
   ref_clk_process :process
   begin
		ref_clk <= '0';
		wait for ref_clk_period/2;
		ref_clk <= '1';
		wait for ref_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for ref_clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;