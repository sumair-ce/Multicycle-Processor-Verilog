`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:46 05/06/2024 
// Design Name: 
// Module Name:    Decoder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Decoder(clk,instruction,OP,RS,RT,RD,SHAMT,FTN,RE,WE,ALUOP,constant,JumpAddress);
input [31:0]instruction;
input clk;
output reg [4:0] RS,RT,RD; 
output reg [5:0] OP,SHAMT,FTN;
output  reg RE,WE;
output reg [1:0]ALUOP;
output reg [15:0] constant;
output reg [31:0] JumpAddress;
reg [25:0] JumpAddresstemp;

always@(instruction)
begin
	OP=instruction[31:26];
	
	if (OP==6'b000001) begin
	constant<=instruction[15:0];
	RS<=instruction[25:21];
	RT<=instruction[20:16];
	FTN<=instruction[5:0];end
	
	else if (OP==6'b000000) begin
	RS<=instruction[25:21];
	RT<=instruction[20:16];
	RD<=instruction[15:11];
	SHAMT<=instruction[10:6];
	FTN<=instruction[5:0];
	ALUOP<=instruction[3:2];
	constant<=16'hxxxx;
	end
	
	else if (OP==6'b000100) begin
	RS<=instruction[25:21];
	RT<=instruction[20:16];
	constant<=instruction[15:0];
	end
	
	else if (OP==6'b000011) begin
	RS<=instruction[25:21];
	RT<=instruction[20:16];
	constant<=instruction[15:0];
	end
	
	else if (OP==6'b000010) begin
	RS<=5'bxxxxx;
	RT<=5'bxxxxx;
	JumpAddresstemp<=instruction[25:0];
	end
	
end

always@(*) begin JumpAddress={6'b0,JumpAddresstemp}; end

endmodule

