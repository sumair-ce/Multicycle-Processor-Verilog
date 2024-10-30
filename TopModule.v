`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:14 05/06/2024 
// Design Name: 
// Module Name:    TopModule 
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
module TopModule(clock,reset);
input clock,reset;

wire ZERO,IORD,PC_WriteCond, PC_write, Mem_Read, Mem_Write, Mem_to_Reg, IR_write, ALU_srcA, Reg_write, Reg_Dst;
wire [31:0] PCC,RESULT,OUT_RESULT,INST,ALUoutResultt,OUT_DATA,MEM,READ1,READ2,OUT_A,OUT_B,OUT_ONE,OUT_TWO,OUT_PROGC;
wire [4:0] RSS,RTT,RDD;
wire [5:0] OPP,SHAMTT,FTNN;
wire [1:0] ALUOPP,ALU_srcB, ALU_Op,PCSRC;
wire [15:0] CONSTANT;
wire [31:0] JUMPADD;

ProgramCounter p1(.clk(clock),.rst(reset),.Jump_addr(JUMPADD),.PC(PCC),.PCvalue(RESULT),.PCsrc(PCSRC),.branch_address(ALUoutResultt),.PCwrite(PC_write), .PCwriteCondi(PC_WriteCond), .zeroflagg(ZERO));

//PCregister p2(.clk(clock), .in_progc (PCC), .out_progc(OUT_PROGC));

Memory m1(.clk(clock),.PC(PCC),.out_data(OUT_DATA), .IorDsignal(IORD), .address(ALUoutResultt), .MemReadsignal(Mem_Read), .MemWrite(Mem_Write), .WriteData(OUT_B));

InstructionRegister instreg(.clk(clock),.irWrite(IR_write), .in_inst(OUT_DATA), .out_inst(INST));

MemoryRegister memreg(.clk(clock), .in_mem(OUT_DATA), .out_mem(MEM));

Decoder d1(.clk(clock),.instruction(INST),.OP(OPP),.RS(RSS),.RT(RTT),.RD(RDD),.SHAMT(SHAMTT),.FTN(FTN),.RE(RE),.WE(WE),.ALUOP(ALUOPP),.constant(CONSTANT),.JumpAddress(JUMPADD));

FSM f1(.clk(clock),.rset(reset),.op(OPP),.PCWriteCond(PC_WriteCond), .PCwrite(PC_write), .IorD(IORD), .MemRead(Mem_Read), .MemWrite(Mem_Write), .MemtoReg(Mem_to_Reg), .IRwrite(IR_write), .ALUsrcA(ALU_srcA), .Regwrite(Reg_write), .RegDst(Reg_Dst), .ALUsrcB(ALU_srcB), .ALUOp(ALU_Op), .PCsource(PCSRC));

RegisterFile r1 (.RegWriteSignal(Reg_write), .MemtoRegSignal(Mem_to_Reg), .RegDestination(Reg_Dst), .clk(clock), .rs(RSS), .rt(RTT), .rd(RDD), .AluOutData(ALUoutResult), .MemOutData(MEM), .read_data_1(READ1), .read_data_2(READ2));

abRegisters abreg(.clk(clock), .in_a(READ1), .in_b(READ2), .out_a(OUT_A), .out_b(OUT_B));

ALUsrcA mux_alusrcA (.ALUsrcAsignal(ALU_srcA), .in_PC(PCC), .in_A(OUT_A), .out_one(OUT_ONE));

ALUsrcB mux_alusrcB (.ALUsrcBsignal(ALU_srcB), .in_B(OUT_B), .in_constant(CONSTANT), .out_two(OUT_TWO));

ALU alu1(.rst(reset),.in_1(OUT_ONE), .in_2(OUT_TWO),.ALUop(ALUOPP),.ALUopp(ALU_Op),.in_pc(PCC),.offset(CONSTANT),.result(RESULT),.zeroflag(ZERO));

ALUoutRegister alureg(.clk(clock), .in_result(RESULT), .out_result(ALUoutResultt));



endmodule
