`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:06:30 05/06/2024 
// Design Name: 
// Module Name:    FSM 
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
module FSM(
    input clk, rset,
    input [5:0] op,
    output reg PCWriteCond, PCwrite, IorD, MemRead, MemWrite, MemtoReg, IRwrite, ALUsrcA, Regwrite, RegDst,
    output reg [1:0] ALUsrcB, ALUOp, PCsource
);

// Define state values
parameter IDLE = 4'b0000, FETCH = 4'b0001, DECODE = 4'b0010, MEMADD = 4'b0011, RTYPE_1 = 4'b0100, 
RTYPE_2 = 4'b0101, BRANCH = 4'b0110, JUMP = 4'b0111, LW_1 = 4'b1000, LW_2 = 4'b1001, SW = 4'b1010;

// Define state register
reg [3:0] currentstate, next;

// State transition logic
always @(posedge clk or posedge rset) begin
    if (rset) begin
        currentstate <= IDLE;
    end else begin
        currentstate <= next;
    end
end

// Next state logic
always @(*) begin
    case (currentstate)
        IDLE: next = FETCH;
        FETCH: next = DECODE;
        DECODE: begin
            case (op)
                6'b000000: next = RTYPE_1;
                6'b000001: next = BRANCH;
                6'b000010: next = JUMP;
                6'b000011: next = MEMADD;
                6'b000100: next = MEMADD;
                default: next = FETCH;
            endcase
        end
        RTYPE_1: next = RTYPE_2;
        RTYPE_2: next = FETCH;
        MEMADD: next = (op == 6'b000011) ? LW_1 : SW;
        LW_1: next = LW_2;
        LW_2: next = FETCH;
        SW: next = FETCH;
        BRANCH: next = FETCH;
        JUMP: next = FETCH;
        default: next = IDLE;
    endcase
end

// Output logic
always @(currentstate) begin
    case (currentstate)
        FETCH: begin
            PCwrite = 1; IorD = 0; MemRead = 1; IRwrite = 1; PCsource = 2'b00; ALUOp = 2'b00; ALUsrcA = 0; ALUsrcB = 2'b01;Regwrite = 0;
        end
        DECODE: begin
            ALUOp = 2'b00; ALUsrcA = 0; ALUsrcB = 2'b11; MemRead=0; PCwrite = 0; IRwrite = 1;
        end
        MEMADD: begin
            ALUOp = 2'b00; ALUsrcA = 1; ALUsrcB = 2'b10; MemRead=0; PCwrite = 0;
        end
        LW_1: begin
            MemRead = 1; IorD = 1; PCwrite = 0; ALUsrcB = 2'b10; IRwrite = 0;
        end
        LW_2: begin
            RegDst = 0; Regwrite = 1; MemtoReg = 1; MemRead=0; PCwrite = 0;
        end 
        BRANCH: begin
            ALUOp = 2'b01; ALUsrcA = 1; ALUsrcB = 2'b00; PCWriteCond = 1; PCsource = 2'b01; MemRead=0; PCwrite = 0;
        end
        RTYPE_1: begin
            ALUOp = 2'b10; ALUsrcA = 1; ALUsrcB = 2'b00; MemRead=0; PCwrite = 0;
        end
        RTYPE_2: begin
            RegDst = 1; Regwrite = 1; MemtoReg = 0; MemRead=0; PCwrite = 0;
        end
		  JUMP: begin
				PCwrite=1; PCsource = 2'b10; MemRead=0;
		  end
		  SW: begin
				MemWrite = 1; IorD = 2'b01; MemRead=0;
		  end
        default: begin
            // Reset all outputs
            PCWriteCond = 0; PCwrite = 0; IorD = 0; MemRead = 0; MemWrite = 0; MemtoReg = 0; IRwrite = 0; PCsource = 0; ALUOp = 0; ALUsrcA = 0; ALUsrcB = 0; Regwrite = 0; RegDst = 0;
        end
    endcase
end

endmodule

