`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:10 05/06/2024 
// Design Name: 
// Module Name:    abRegisters 
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
module abRegisters(clk,in_a, in_b, out_a, out_b);
input clk;
input [31:0] in_a, in_b;
output reg [31:0] out_a, out_b;

reg [31:0] a,b;

always@(*) begin
a=in_a; b=in_b; end

always @(posedge clk) begin
out_a=a; out_b=b; end

endmodule
