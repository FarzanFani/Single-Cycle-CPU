module PC(out, in, clk, startin);
	input [31:0] in;
	output reg [31:0] out;
	input startin;
	input clk;

	always @(posedge clk) begin
		if(startin == 0)begin
			out <= in;
		end 
		else begin
			out <= 0;
		end
	end
endmodule

