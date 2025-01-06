//SystemVerilog code for a 2 option multiplexer

module mux2(input logic [3:0] d0, d1,
				input logic s,
				output logic [3:0] b);

	assign b = s ? d1 : d0;
endmodule