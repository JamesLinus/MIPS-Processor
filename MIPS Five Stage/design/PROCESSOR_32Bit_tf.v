`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:11:05 03/11/2016
// Design Name:   PROCESSOR_32Bit
// Module Name:   C:/Users/David/Desktop/132LFinal/Pipeline_MIPS/PROCESSO_32Bit_tf.v
// Project Name:  Pipeline_MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR_32Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSO_32Bit_tf;

	// Inputs
	reg ref_clk;
	reg reset;

	// Outputs
	wire [31:0] out_PC;
	wire [31:0] out_PCF;
	wire [31:0] out_InstrF;
	wire [31:0] out_PCPlus4F;
	wire [31:0] out_InstrD;
	wire [31:0] out_PCPlus4D;
	wire out_RegWriteD;
	wire out_MemtoRegD;
	wire out_MemWriteD;
	wire [5:0] out_ALUControlD;
	wire out_ALUSrcD;
	wire out_RegDstD;
	wire out_BranchD;
	wire [1:0] out_DSizeD;
	wire out_LoadControlD;
	wire [31:0] out_RD1D;
	wire [31:0] out_RD2D;
	wire [31:0] out_SignImmD;
	wire out_RegWriteE;
	wire out_MemtoRegE;
	wire out_MemWriteE;
	wire [5:0] out_ALUControlE;
	wire out_ALUSrcE;
	wire out_RegDstE;
	wire out_BranchE;
	wire [1:0] out_DSizeE;
	wire out_LoadControlE;
	wire [31:0] out_RD1E;
	wire [31:0] out_RD2E;
	wire [4:0] out_RsE;
	wire [4:0] out_RtE;
	wire [4:0] out_RdE;
	wire [31:0] out_SignImmE;
	wire [31:0] out_PCPlus4E;
	wire [4:0] out_WriteRegE;
	wire [31:0] out_SrcAE;
	wire [31:0] out_WriteDataE;
	wire [31:0] out_SrcBE;
	wire [31:0] out_SignImmShiftedE;
	wire out_ZeroE;
	wire [31:0] out_ALUOutE;
	wire [31:0] out_PCBranchE;
	wire out_RegWriteM;
	wire out_MemtoRegM;
	wire out_MemWriteM;
	wire out_BranchM;
	wire [1:0] out_DSizeM;
	wire out_LoadControlM;
	wire out_ZeroM;
	wire [31:0] out_ALUOutM;
	wire [31:0] out_WriteDataM;
	wire [4:0] out_WriteRegM;
	wire [31:0] out_PCBranchM;
	wire out_PCSrcM;
	wire [31:0] out_ReadDataM;
	wire out_RegWriteW;
	wire out_MemtoRegW;
	wire [31:0] out_ReadDataW;
	wire [31:0] out_ALUOutW;
	wire [4:0] out_WriteRegW;
	wire [31:0] out_ResultW;
	wire out_StallF;
	wire out_StallD;
	wire out_FlushE;
	wire [1:0] out_ForwardAE;
	wire [1:0] out_ForwardBE;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR_32Bit uut (
		.ref_clk(ref_clk), 
		.reset(reset), 
		.out_PC(out_PC), 
		.out_PCF(out_PCF), 
		.out_InstrF(out_InstrF), 
		.out_PCPlus4F(out_PCPlus4F), 
		.out_InstrD(out_InstrD), 
		.out_PCPlus4D(out_PCPlus4D), 
		.out_RegWriteD(out_RegWriteD), 
		.out_MemtoRegD(out_MemtoRegD), 
		.out_MemWriteD(out_MemWriteD), 
		.out_ALUControlD(out_ALUControlD), 
		.out_ALUSrcD(out_ALUSrcD), 
		.out_RegDstD(out_RegDstD), 
		.out_BranchD(out_BranchD), 
		.out_DSizeD(out_DSizeD), 
		.out_LoadControlD(out_LoadControlD), 
		.out_RD1D(out_RD1D), 
		.out_RD2D(out_RD2D), 
		.out_SignImmD(out_SignImmD), 
		.out_RegWriteE(out_RegWriteE), 
		.out_MemtoRegE(out_MemtoRegE), 
		.out_MemWriteE(out_MemWriteE), 
		.out_ALUControlE(out_ALUControlE), 
		.out_ALUSrcE(out_ALUSrcE), 
		.out_RegDstE(out_RegDstE), 
		.out_BranchE(out_BranchE), 
		.out_DSizeE(out_DSizeE), 
		.out_LoadControlE(out_LoadControlE), 
		.out_RD1E(out_RD1E), 
		.out_RD2E(out_RD2E), 
		.out_RsE(out_RsE), 
		.out_RtE(out_RtE), 
		.out_RdE(out_RdE), 
		.out_SignImmE(out_SignImmE), 
		.out_PCPlus4E(out_PCPlus4E), 
		.out_WriteRegE(out_WriteRegE), 
		.out_SrcAE(out_SrcAE), 
		.out_WriteDataE(out_WriteDataE), 
		.out_SrcBE(out_SrcBE), 
		.out_SignImmShiftedE(out_SignImmShiftedE), 
		.out_ZeroE(out_ZeroE), 
		.out_ALUOutE(out_ALUOutE), 
		.out_PCBranchE(out_PCBranchE), 
		.out_RegWriteM(out_RegWriteM), 
		.out_MemtoRegM(out_MemtoRegM), 
		.out_MemWriteM(out_MemWriteM), 
		.out_BranchM(out_BranchM), 
		.out_DSizeM(out_DSizeM), 
		.out_LoadControlM(out_LoadControlM), 
		.out_ZeroM(out_ZeroM), 
		.out_ALUOutM(out_ALUOutM), 
		.out_WriteDataM(out_WriteDataM), 
		.out_WriteRegM(out_WriteRegM), 
		.out_PCBranchM(out_PCBranchM), 
		.out_PCSrcM(out_PCSrcM), 
		.out_ReadDataM(out_ReadDataM), 
		.out_RegWriteW(out_RegWriteW), 
		.out_MemtoRegW(out_MemtoRegW), 
		.out_ReadDataW(out_ReadDataW), 
		.out_ALUOutW(out_ALUOutW), 
		.out_WriteRegW(out_WriteRegW), 
		.out_ResultW(out_ResultW), 
		.out_StallF(out_StallF), 
		.out_StallD(out_StallD), 
		.out_FlushE(out_FlushE), 
		.out_ForwardAE(out_ForwardAE), 
		.out_ForwardBE(out_ForwardBE)
	);

	initial begin
		// Initialize Inputs
		ref_clk = 0;
		reset = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
		ref_clk = 1;
		#100;
   	ref_clk = 0;
		#100;
	end
      
endmodule

