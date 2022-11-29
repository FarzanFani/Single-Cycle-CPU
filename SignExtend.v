module SignExtend(in, result);
	input[15:0] in;
	output[31:0] result;

	assign result[31:0] = {{16{in[15]}}, in[15:0]};
endmodule
