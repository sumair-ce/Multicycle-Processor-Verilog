`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:44 04/16/2024 
// Design Name: 
// Module Name:    stateregister 
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
module stateregister(opcode, clk, rst, current, next);
input [5:0] opcode;
input clk, rst;
input [3:0] current;
output [3:0] next;

localparam [3:0] IDLE= 4'b0000;

always @ (posedge clk or posedge rst) begin
	next=current;
	if (reset) begin current = IDLE; end
	else begin current=next; end
end

endmodule
