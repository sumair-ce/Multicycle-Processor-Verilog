`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:29 05/06/2024 
// Design Name: 
// Module Name:    ALUsrcA 
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
module ALUsrcA(ALUsrcAsignal,in_PC,in_A,out_one);
input [31:0] in_PC, in_A;
input ALUsrcAsignal;
output reg [31:0] out_one;


always @(*) begin
	if (ALUsrcAsignal) begin
		out_one= in_A;
	end
	else begin
		out_one= in_PC; end
end
endmodule
