`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:58:25 05/06/2024
// Design Name:   TopModule
// Module Name:   E:/Academics/CSA/Projects/MulticycleProcessor/tb_topModule.v
// Project Name:  MulticycleProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TopModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_topModule;

	// Inputs
	reg clock;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	TopModule uut (
		.clock(clock), 
		.reset(reset)
	);
always #5 clock=~clock;
	initial begin
		clock = 1;
		reset = 1;
		
		#40
		reset = 0;

	end
      
endmodule

