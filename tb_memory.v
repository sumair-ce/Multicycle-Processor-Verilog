`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:19:10 05/06/2024
// Design Name:   InstructionMemory
// Module Name:   E:/Academics/CSA/Projects/MulticycleProcessor/tb_memory.v
// Project Name:  MulticycleProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_memory;

	// Inputs
	reg clk;
	reg [31:0] PC;
	reg IorDsignal;
	reg [31:0] address;
	reg MemRead;
	reg MemWrite;
	reg [31:0] WriteData;

	// Outputs
	wire [31:0] out_data;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.clk(clk), 
		.PC(PC), 
		.out_data(out_data), 
		.IorDsignal(IorDsignal), 
		.address(address), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.WriteData(WriteData)
	);

always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		
		#5;
		
		PC = 0;
		IorDsignal = 0;
		address = 0;
		MemRead = 1;
		MemWrite = 0;
		WriteData = 0;

		// Wait 100 ns for global reset to finish
		#5;
       
		PC = 1;
		IorDsignal = 1;
		address = 3;
		MemRead = 1;
		MemWrite = 0;
		WriteData = 0;
		 
		 
		// Add stimulus here

	end
      
endmodule

