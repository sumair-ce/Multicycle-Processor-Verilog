`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:44:49 04/21/2024
// Design Name:   FSM
// Module Name:   E:/Academics/CSA/Projects/MulticycleProcessor/tb_FSM.v
// Project Name:  MulticycleProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FSM;

	// Inputs
	reg clk;
	reg reset;
	reg [5:0] op;

	// Outputs
	wire PCWriteCond;
	wire PCwrite;
	wire IorD;
	wire MemRead;
	wire MemWrite;
	wire MemtoReg;
	wire IRwrite;
	wire ALUsrcA;
	wire Regwrite;
	wire RegDst;
	wire [1:0] ALUsrcB;
	wire [1:0] ALUOp;
	wire [1:0] PCsource;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.reset(reset), 
		.op(op), 
		.PCWriteCond(PCWriteCond), 
		.PCwrite(PCwrite), 
		.IorD(IorD), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.IRwrite(IRwrite), 
		.ALUsrcA(ALUsrcA), 
		.Regwrite(Regwrite), 
		.RegDst(RegDst), 
		.ALUsrcB(ALUsrcB), 
		.ALUOp(ALUOp), 
		.PCsource(PCsource)
	);

	always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#40;
		reset = 0;
		op = 6'b000000;
      
		
		#40;
		op = 6'b000001;
		#30;
		op = 6'd2;
		#30;
		op = 6'd3;
		#50;
		op = 6'd4;
		#40;
		
		// Add stimulus here

	end
      
endmodule

