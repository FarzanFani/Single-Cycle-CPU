module mux_5(input1, input2, op, out);
	input [4:0] input1;
	input [4:0] input2;
	input op;
	output [4:0] out;

	assign out = op ? input1 : input2;
	
	
endmodule
