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
// CREATED		"Fri Jun  7 10:47:19 2024"

module SyncCount(
	Clock,
	Reset,
	HSync,
	VSync,
	HDisplay,
	VDisplay,
	DisplayedColumns,
	DisplayedRows
);


input wire	Clock;
input wire	Reset;
output wire	HSync;
output wire	VSync;
output wire	HDisplay;
output wire	VDisplay;
output wire	[9:0] DisplayedColumns;
output wire	[9:0] DisplayedRows;

wire	Clk;
wire	[9:0] ColCount;
wire	[9:0] Count;
wire	GTE144;
wire	GTE35;
wire	HCycle;
wire	HReset;
wire	LT515;
wire	LT784;
wire	[9:0] OneCycle;
wire	ResetH;
wire	ResetV;
wire	[9:0] RowCount;
wire	VCycle;
wire	VReset;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;





counter	b2v_inst(
	.clk(Clk),
	.reset(HReset),
	.q(Count));
	defparam	b2v_inst.N = 10;


counter	b2v_inst1(
	.clk(ResetH),
	.reset(VReset),
	.q(OneCycle));
	defparam	b2v_inst1.N = 10;


comparator	b2v_inst10(
	.a(OneCycle),
	
	
	
	
	
	.gte(VSync));
	defparam	b2v_inst10.b = 2;
	defparam	b2v_inst10.N = 10;

assign	SYNTHESIZED_WIRE_3 =  ~HCycle;

assign	SYNTHESIZED_WIRE_0 =  ~Reset;

assign	SYNTHESIZED_WIRE_4 =  ~Reset;

assign	HCycle = GTE144 & LT784;

assign	SYNTHESIZED_WIRE_1 =  ~VCycle;


comparator	b2v_inst17(
	.a(Count),
	
	
	
	
	
	.gte(GTE144));
	defparam	b2v_inst17.b = 144;
	defparam	b2v_inst17.N = 10;


comparator	b2v_inst18(
	.a(Count),
	
	
	.lt(LT784)
	
	
	);
	defparam	b2v_inst18.b = 785;
	defparam	b2v_inst18.N = 10;

assign	SYNTHESIZED_WIRE_2 = Clk & HCycle;


comparator	b2v_inst2(
	.a(Count),
	
	
	
	
	
	.gte(ResetH));
	defparam	b2v_inst2.b = 800;
	defparam	b2v_inst2.N = 10;


comparator	b2v_inst21(
	.a(OneCycle),
	
	
	
	
	
	.gte(GTE35));
	defparam	b2v_inst21.b = 35;
	defparam	b2v_inst21.N = 10;


comparator	b2v_inst22(
	.a(OneCycle),
	
	
	
	.lte(LT515)
	
	);
	defparam	b2v_inst22.b = 515;
	defparam	b2v_inst22.N = 10;

assign	HReset = ResetH | SYNTHESIZED_WIRE_0;


comparator	b2v_inst4(
	.a(Count),
	
	
	
	
	
	.gte(HSync));
	defparam	b2v_inst4.b = 96;
	defparam	b2v_inst4.N = 10;


counter	b2v_inst5(
	.clk(ResetH),
	.reset(SYNTHESIZED_WIRE_1),
	.q(RowCount));
	defparam	b2v_inst5.N = 10;


counter	b2v_inst6(
	.clk(SYNTHESIZED_WIRE_2),
	.reset(SYNTHESIZED_WIRE_3),
	.q(ColCount));
	defparam	b2v_inst6.N = 10;


comparator	b2v_inst7(
	.a(OneCycle),
	
	
	
	
	
	.gte(ResetV));
	defparam	b2v_inst7.b = 525;
	defparam	b2v_inst7.N = 10;

assign	VCycle = GTE35 & LT515;

assign	VReset = ResetV | SYNTHESIZED_WIRE_4;

assign	Clk = Clock;
assign	HDisplay = HCycle;
assign	VDisplay = VCycle;
assign	DisplayedColumns = ColCount;
assign	DisplayedRows = RowCount;

endmodule
