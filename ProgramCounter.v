`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:56 05/06/2024 
// Design Name: 
// Module Name:    ProgramCounter 
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:26:23 04/23/2024 
// Design Name: 
// Module Name:    ProgramCounter 
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
module ProgramCounter(clk,rst,Jump_addr,PC,PCvalue,PCsrc,branch_address,PCwriteCondi,PCwrite,zeroflagg);
input clk,rst,PCwrite,PCwriteCondi,zeroflagg;
input [1:0] PCsrc;
input [31:0]branch_address;
input [31:0] PCvalue;
input [31:0] Jump_addr;
output reg [31:0] PC;

reg PC_reg;
reg [31:0]temp;
reg ANDgate, ORgate;

always@(*) begin ANDgate=PCwriteCondi & zeroflagg; end
always@(*) begin ORgate=PCwrite | ANDgate; end

/*reg [31:0] const_temp;
always @(*) begin
const_temp <= {6'b0, Jump_addr};
end
*/

always @(posedge clk or posedge rst)
begin
	if(rst) begin PC<=0;end
	else
				begin
					if(PCsrc==2'b00 && PCwrite) begin
						PC<=PCvalue; end
					else if(PCsrc==2'b10) begin
						if (ORgate) begin
						PC<= PC+ Jump_addr; end end
					else if(PCsrc==2'b01) begin
						if (ORgate) begin
						PC<= branch_address; end end
				end
		end

endmodule

