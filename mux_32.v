module mux_32(input1, input2, op, out);

	input [31:0] input1;
	input [31:0] input2;
	input op;
	output [31:0] out;
	assign out = op ? input1 : input2;
endmodule
