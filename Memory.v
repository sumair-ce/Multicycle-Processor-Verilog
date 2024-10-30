`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:37 05/06/2024 
// Design Name: 
// Module Name:    Memory 
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
module Memory(clk,PC,out_data, IorDsignal, address, MemReadsignal, MemWrite,WriteData);
input [31:0] PC,WriteData,address;
input clk,IorDsignal,MemReadsignal, MemWrite;
output reg [31:0] out_data;
reg [31:0] instruc_mem [20:0];

(*RAM_STYLE = "BLOCK" *)
initial begin
$readmemb("von_mem.txt", instruc_mem, 0, 20);
end


always @(MemReadsignal) begin
	if(IorDsignal==1'b0 && MemReadsignal==1'b1) begin
		out_data<=instruc_mem[PC]; end
	else if (IorDsignal==1'b1 && MemReadsignal==1'b1) begin
		out_data <=instruc_mem[address]; end
end

always @(address) begin
	if(MemWrite==1'b1) begin
		instruc_mem[address]=WriteData; end
end

endmodule

