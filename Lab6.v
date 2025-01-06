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
// CREATED		"Fri Jun  7 10:46:50 2024"

module Lab6(
	Clock,
	Reset,
	RGBin,
	HSync,
	VSync,
	DisplayedColumns,
	DisplayedRows,
	RGBout
);


input wire	Clock;
input wire	Reset;
input wire	[11:0] RGBin;
output wire	HSync;
output wire	VSync;
output wire	[9:0] DisplayedColumns;
output wire	[9:0] DisplayedRows;
output wire	[11:0] RGBout;

wire	Clk;
wire	HalfClk;
wire	HDisplay;
wire	ON;
wire	[11:0] RGBout_ALTERA_SYNTHESIZED;
wire	VDisplay;
wire	[0:3] SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_3 = 0;




mux2	b2v_inst(
	.s(ON),
	.d0(SYNTHESIZED_WIRE_3),
	.d1(RGBin[11:8]),
	.b(RGBout_ALTERA_SYNTHESIZED[11:8]));


SyncCount	b2v_inst1(
	.Clock(HalfClk),
	.Reset(Reset),
	.HDisplay(HDisplay),
	.VDisplay(VDisplay),
	.HSync(HSync),
	.VSync(VSync),
	.DisplayedColumns(DisplayedColumns),
	.DisplayedRows(DisplayedRows));

assign	ON = HDisplay & VDisplay;


mux2	b2v_inst3(
	.s(ON),
	.d0(SYNTHESIZED_WIRE_3),
	.d1(RGBin[3:0]),
	.b(RGBout_ALTERA_SYNTHESIZED[3:0]));



ClockDiv	b2v_inst5(
	.Clock(Clk),
	.Reset(Reset),
	.HalfClk(HalfClk));


mux2	b2v_inst6(
	.s(ON),
	.d0(SYNTHESIZED_WIRE_3),
	.d1(RGBin[7:4]),
	.b(RGBout_ALTERA_SYNTHESIZED[7:4]));

assign	Clk = Clock;
assign	RGBout = RGBout_ALTERA_SYNTHESIZED;

endmodule
