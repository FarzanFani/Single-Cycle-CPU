module ALU(in1, in2, operation, out, zero);
	input [31:0] in1;
	input [31:0] in2;
	input [3:0] operation;
	
	output [31:0] out;
	
	reg [31:0] temp_result;
	output reg zero;

	always @(*) begin
		zero <= 1'b0;
		case(operation) 
			4'b0000 : temp_result <= in1 & in2; // AND
			4'b0001 : temp_result <= in1 | in2; // OR
			4'b0010 : temp_result <= in1 + in2; // ADD
			4'b0110 : temp_result <= in1 - in2; // SUB
			4'b0111 : temp_result <= (in1 < in2) ? 32'b1 : 32'b0; // Set On Less Than
			4'b1100 : temp_result <= -in1 & -in2; // NOR
			default : temp_result <= 32'b0;
		endcase
		if(temp_result == 0) begin
			zero <= 1;

		end
	end

	assign out = temp_result;

endmodule
