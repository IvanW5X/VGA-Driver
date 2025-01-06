//SystemVerilog code for a comparator

module comparator #(parameter N = 8, parameter b = 100)
						(input logic [N-1:0] a,
						 output logic eq, neq, lt, lte, gt, gte);
						 
	assign eq = (a == b);
	assign neq = (a != b);
	assign lt = (a < b);
	assign lte = (a <= b);
	assign gt = (a > b);
	assign gte = (a >= b);
endmodule