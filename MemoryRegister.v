`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:17 05/06/2024 
// Design Name: 
// Module Name:    MemoryRegister 
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
module MemoryRegister(clk, in_mem, out_mem);
input clk;
input [31:0] in_mem;
output reg [31:0] out_mem;

reg [31:0] mem;

always@(*) begin
mem=in_mem; end

always@(posedge clk) begin
out_mem=mem;
end



endmodule
