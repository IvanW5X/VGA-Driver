//Address Converter module

module address_converter (input logic [9:0] rows, columns,
								  output logic [15:0] b);
	
	always_comb
		b = rows * 256 + columns;
endmodule