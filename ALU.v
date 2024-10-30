`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:57 05/06/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] in_1, in_2,
	 input rst,
    input [1:0] ALUop,
	 input [1:0] ALUopp,
	 input [31:0] in_pc,
	 input [15:0] offset,
    output reg [31:0] result,
    output reg zeroflag
);


reg [31:0] offset_temp;
always @(*) begin
offset_temp <= {16'b0, offset};
end

always @(*) begin
if(rst) begin result<=32'd0; end
else begin
if (ALUopp==2'b00) begin result = in_1 + in_2; end
else if (ALUopp==2'b01) begin result = in_2 - in_1; end
else if (ALUopp==2'b10) begin
    case (ALUop)
        2'b00: begin result = in_1 + in_2; end
        2'b01: begin result = in_2 - in_1; end
        2'b10: begin result = in_1 * in_2; end
        2'b11: begin result = ~ in_1; end
        default: result = 32'hxxxxxxxx;
    endcase
end
end
end

always @(result) begin
    zeroflag = (result == 0) ? 1'b1 : 1'b0;
end

endmodule

