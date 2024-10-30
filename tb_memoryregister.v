`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:38:16 05/06/2024
// Design Name:   MemoryRegister
// Module Name:   E:/Academics/CSA/Projects/MulticycleProcessor/tb_memoryregister.v
// Project Name:  MulticycleProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MemoryRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_memoryregister;

	// Inputs
	reg clk;
	reg [31:0] in_mem;

	// Outputs
	wire [31:0] out_mem;

	// Instantiate the Unit Under Test (UUT)
	MemoryRegister uut (
		.clk(clk), 
		.in_mem(in_mem), 
		.out_mem(out_mem)
	);
always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		in_mem = 32'd34;

		// Wait 100 ns for global reset to finish
		#4;
        
		// Add stimulus here

	end
      
endmodule

