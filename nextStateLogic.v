`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:48:42 04/16/2024 
// Design Name: 
// Module Name:    nextStateLogic 
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
module nextStateLogic(clk, currentstate, op, IDLE, FETCH, DECODE, RTYPE_1, RTYPE_2, BRANCH, JUMP, MEMADD, LW_1, LW_2, SW );
input clk;
input [3:0] currentstate;
input [5:0] op;
output IDLE, FETCH, DECODE, RTYPE_1, RTYPE_2, BRANCH, JUMP, MEMADD, LW_1, LW_2, SW;

always @(currentstate) begin
case (currentstate)
	IDLE: currentstate= FETCH;
	FETCH: currentstate=DECODE;
	DECODE: 
			case (op)
				6'b000000: currentstate= RTPE_1;
				6'b000001: currentstate= BRANCH;
				6'b000010: currentstate= JUMP;
				6'b000011: currentstate= MEMADD;
				6'b000101: currentstate= MEMADD;
			endcase
	RTYPE_1: currentstate=RTYPE_2;
	RTYPE_2: currentstate=FETCH;
	MEMADD: if (op==6'b000011) begin currentstate=LW_1; end
			  else begin currentstate=SW; end
	LW_1: currentstate=LW_2;
	LW_2: currentstate= FETCH;
	SW: currentstate= FETCH;
	BRANCH: currentstate= FETCH;
	JUMP: currentstate= FETCH;
endcase
end

endmodule
