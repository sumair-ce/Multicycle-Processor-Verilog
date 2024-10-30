`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:40:11 05/07/2024 
// Design Name: 
// Module Name:    PCregister 
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
module PCregister(clk,in_progc, out_progc);
input clk;
input [31:0] in_progc;
output reg [31:0] out_progc;
reg progc;

always @(*) begin progc<=in_progc; end

always @(posedge clk) begin out_progc<= progc; end

endmodule
