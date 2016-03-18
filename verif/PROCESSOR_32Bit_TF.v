`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:36:02 02/14/2016
// Design Name:   PROCESSOR_32Bit
// Module Name:   C:/Users/David/Desktop/MIPS_PROCESSOR_32Bit/PROCESSOR_32Bit_TF.v
// Project Name:  testgate
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

module PROCESSOR_32Bit_TF;

	// Inputs
	reg ref_clk;
	reg reset;

	// Outputs
	wire [31:0] out_pc;
	wire [31:0] out_adder_pc;
	wire [31:0] out_rom;
	wire [25:0] out_shiftleft;
	wire [4:0] out_mux_jal;
	wire [4:0] out_mux_regdst;
	wire [4:0] out_mux_jaladdr;
	wire [31:0] out_mux_jaldata;
	wire [31:0] out_concatenate;
	wire out_controller_jal;
	wire out_controller_regdst;
	wire out_controller_jaladdr;
	wire out_controller_jaldata;
	wire out_controller_shiftvalue;
	wire out_controller_load;
	wire out_controller_jr;
	wire out_controller_jumporjr;
	wire out_controller_lui;
	wire out_controller_branch;
	wire out_controller_memtoreg;
	wire out_controller_memwrite;
	wire [1:0] out_controller_dsize;
	wire [5:0] out_controller_alu;
	wire out_controller_alusrc;
	wire out_controller_regwrite;
	wire [31:0] out_regfile_rdata1;
	wire [31:0] out_regfile_rdata2;
	wire [31:0] out_signextend_a;
	wire [31:0] out_signextend_b;
	wire [31:0] out_mux_alusrc;
	wire [31:0] out_mux_shiftvalue;
	wire [31:0] out_shiftrighttwo;
	wire out_alu_branch;
	wire [31:0] out_alu;
	wire [31:0] out_adder_jump;
	wire [31:0] out_mux_jump;
	wire out_and;
	wire [31:0] out_shiftandextend;
	wire [31:0] out_splitter;
	wire [31:0] out_mux_jumporjr;
	wire [31:0] out_mux_jr;
	wire [31:0] out_ram;
	wire [31:0] out_mux_lui;
	wire [31:0] out_mux_wb;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR_32Bit uut (
		.ref_clk(ref_clk), 
		.reset(reset), 
		.out_pc(out_pc), 
		.out_adder_pc(out_adder_pc), 
		.out_rom(out_rom), 
		.out_shiftleft(out_shiftleft), 
		.out_mux_jal(out_mux_jal), 
		.out_mux_regdst(out_mux_regdst), 
		.out_mux_jaladdr(out_mux_jaladdr), 
		.out_mux_jaldata(out_mux_jaldata), 
		.out_concatenate(out_concatenate), 
		.out_controller_jal(out_controller_jal), 
		.out_controller_regdst(out_controller_regdst), 
		.out_controller_jaladdr(out_controller_jaladdr), 
		.out_controller_jaldata(out_controller_jaldata), 
		.out_controller_shiftvalue(out_controller_shiftvalue), 
		.out_controller_load(out_controller_load), 
		.out_controller_jr(out_controller_jr), 
		.out_controller_jumporjr(out_controller_jumporjr), 
		.out_controller_lui(out_controller_lui), 
		.out_controller_branch(out_controller_branch), 
		.out_controller_memtoreg(out_controller_memtoreg), 
		.out_controller_memwrite(out_controller_memwrite), 
		.out_controller_dsize(out_controller_dsize), 
		.out_controller_alu(out_controller_alu), 
		.out_controller_alusrc(out_controller_alusrc), 
		.out_controller_regwrite(out_controller_regwrite), 
		.out_regfile_rdata1(out_regfile_rdata1), 
		.out_regfile_rdata2(out_regfile_rdata2), 
		.out_signextend_a(out_signextend_a), 
		.out_signextend_b(out_signextend_b), 
		.out_mux_alusrc(out_mux_alusrc), 
		.out_mux_shiftvalue(out_mux_shiftvalue), 
		.out_shiftrighttwo(out_shiftrighttwo), 
		.out_alu_branch(out_alu_branch), 
		.out_alu(out_alu), 
		.out_adder_jump(out_adder_jump), 
		.out_mux_jump(out_mux_jump), 
		.out_and(out_and), 
		.out_shiftandextend(out_shiftandextend), 
		.out_splitter(out_splitter), 
		.out_mux_jumporjr(out_mux_jumporjr), 
		.out_mux_jr(out_mux_jr), 
		.out_ram(out_ram), 
		.out_mux_lui(out_mux_lui), 
		.out_mux_wb(out_mux_wb)
	);

	initial begin
		// Initialize Inputs
		ref_clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#100;
      ref_clk = 1'b1;
		#100;
      ref_clk = 1'b0;
		#10000;		
		reset = 1'b0;
		  
		// Add stimulus here

      $finish;
	end
endmodule

