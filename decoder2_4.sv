//SystemVerilog code of a 2-4 bit decoder

module decoder2_4(input logic [1:0] a,
						output logic [3:0] b);

	always_comb
		case(a)
			2'b00: b = 4'b0000;
			2'b01: b = 4'b0101;
			2'b10: b = 4'b1010;
			2'b11: b = 4'b1111;
		endcase
endmodule