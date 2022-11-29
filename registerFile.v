module registerFile(read1, read2, writeReg, writeData, regWrite, data1, data2, startin, clk, val, regNo);
	
	input [4:0] read1, read2, writeReg, regNo;
	input startin, regWrite, clk;
	input [31:0] writeData;
	output [31:0] data1, data2, val;

	reg [31:0] registers [31:0];

	always @(*) begin
		if(startin ==1) begin
			registers[0] <= 32'b0;
		end
	end

	assign val = startin ? 32'b0 : registers[regNo];
	assign data1 = startin ? 32'b0 : registers[read1];
	assign data2 = startin ? 32'b0 : registers[read2];

	always @(posedge clk) begin
		if(regWrite == 1 && startin == 0 && writeReg != 5'b0) begin
			registers[writeReg] <= writeData;
		end
	end
endmodule
