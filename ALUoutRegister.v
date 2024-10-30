`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:19 05/06/2024 
// Design Name: 
// Module Name:    ALUoutRegister 
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
module ALUoutRegister(clk,in_result, out_result);
input clk;
input [31:0] in_result;
output reg[31:0] out_result;
reg [31:0] ALUout;

always @(*) begin
ALUout<=in_result; end

always @(posedge clk) begin
out_result<=ALUout;
end

endmodule
