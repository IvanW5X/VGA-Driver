// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"
// CREATED		"Fri Jun  7 10:47:07 2024"

module Lab7(
	Clock,
	Reset,
	Bin,
	Gin,
	Rin,
	HSync,
	VSync,
	RGBout
);


input wire	Clock;
input wire	Reset;
input wire	[1:0] Bin;
input wire	[1:0] Gin;
input wire	[1:0] Rin;
output wire	HSync;
output wire	VSync;
output wire	[11:0] RGBout;

wire	[11:0] Background;
wire	Clk;
wire	[9:0] DisplayedColumns;
wire	[9:0] DisplayedRows;
wire	[15:0] ImageOut;
wire	SYNTHESIZED_WIRE_0;
wire	[15:0] SYNTHESIZED_WIRE_1;
wire	[11:0] SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;





decoder2_4	b2v_inst(
	.a(Rin),
	.b(Background[11:8]));


decoder2_4	b2v_inst1(
	.a(Gin),
	.b(Background[7:4]));


ClockDiv	b2v_inst11(
	.Clock(Clk),
	.Reset(Reset),
	.HalfClk(SYNTHESIZED_WIRE_0));


ROM_LINUX	b2v_inst12(
	.clock(SYNTHESIZED_WIRE_0),
	.address(SYNTHESIZED_WIRE_1),
	.q(ImageOut));


decoder2_4	b2v_inst2(
	.a(Bin),
	.b(Background[3:0]));


Lab6	b2v_inst3(
	.Clock(Clk),
	.Reset(Reset),
	.RGBin(SYNTHESIZED_WIRE_2),
	.HSync(HSync),
	.VSync(VSync),
	.DisplayedColumns(DisplayedColumns),
	.DisplayedRows(DisplayedRows),
	.RGBout(RGBout));


comparator	b2v_inst4(
	.a(DisplayedRows),
	
	
	.lt(SYNTHESIZED_WIRE_3)
	
	
	);
	defparam	b2v_inst4.b = 256;
	defparam	b2v_inst4.N = 10;


comparator	b2v_inst5(
	.a(DisplayedColumns),
	
	
	.lt(SYNTHESIZED_WIRE_4)
	
	
	);
	defparam	b2v_inst5.b = 256;
	defparam	b2v_inst5.N = 10;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4;


display_mux	b2v_inst8(
	.s(SYNTHESIZED_WIRE_5),
	.d0(Background),
	.d1(ImageOut[15:4]),
	.b(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst8.N = 12;


address_converter	b2v_inst9(
	.columns(DisplayedColumns),
	.rows(DisplayedRows),
	.b(SYNTHESIZED_WIRE_1));

assign	Clk = Clock;

endmodule
