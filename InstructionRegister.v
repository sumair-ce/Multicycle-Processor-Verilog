`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:37:45 05/06/2024 
// Design Name: 
// Module Name:    InstructionRegister 
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
module InstructionRegister(clk,irWrite, in_inst, out_inst);
input clk,irWrite;
input [31:0] in_inst;
output reg [31:0] out_inst;

reg [31:0] inst;

always@(*) begin
if (irWrite) begin
inst=in_inst;
end
end

always @(posedge clk) begin
out_inst=inst;
end


endmodule
