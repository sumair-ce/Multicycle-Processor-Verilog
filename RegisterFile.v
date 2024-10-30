`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:19 05/06/2024 
// Design Name: 
// Module Name:    RegisterFile 
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
module  RegisterFile #(parameter N=32, Depth=16)(MemOutData,AluOutData,RegWriteSignal,MemtoRegSignal,RegDestination,clk,rs,rt,rd,read_data_1, read_data_2);
input [4:0] rs,rt,rd;
input clk,RegDestination,RegWriteSignal,MemtoRegSignal;
output reg [N-1:0] read_data_1, read_data_2;
reg [N-1:0] registerfile [Depth-1:0];
reg [31:0] writeData;
input [31:0] MemOutData,AluOutData;
(*RAM_STYLE = "BLOCK" *)
initial begin
$readmemb("regfile.txt", registerfile , 0, 15);
end

always @(*) begin
  // Read operations
  read_data_1 <= registerfile[rs];
  read_data_2 <= registerfile[rt];
  
  
  if(MemtoRegSignal) begin
	 writeData<=MemOutData; end
  else begin
    writeData<=AluOutData; end
  
  
  // Write operations (conditioned on clock edge)
  if (RegWriteSignal) begin
    if (RegDestination) begin
      registerfile[rd] <= writeData;
    end else begin
      registerfile[rt] <= writeData;
    end
  end
end

endmodule

