`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:13 05/06/2024 
// Design Name: 
// Module Name:    ALUsrcB 
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
module ALUsrcB(ALUsrcBsignal,in_B,in_PC,in_constant,out_two);
input [31:0] in_PC, in_B;
input [15:0]in_constant;
input [1:0] ALUsrcBsignal;
output reg [31:0] out_two;

reg [31:0] const_temp;
always @(*) begin
const_temp <= {16'b0, in_constant};
end

always @(*) begin
	if (ALUsrcBsignal==2'b00) begin
		out_two<= in_B;
	end
	else if (ALUsrcBsignal==2'b01)begin
		out_two<= 32'd1;
	end
	else if (ALUsrcBsignal==2'b10)begin
		out_two<= const_temp;
	end
	else begin
		out_two<= const_temp; end	
end

endmodule
