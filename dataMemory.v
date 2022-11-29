module DataMemory(address, writeData, memWrite, memRead, readData, startin, clk);

	input [31:0] address, writeData;
	input memWrite, memRead, startin, clk;
	output reg [31:0] readData;

	reg [7:0] memory[0:128];

	always @(*) begin
		if(startin == 1)begin
			{memory[0],memory[1],memory[2],memory[3]} <= 32'd5;
			{memory[4],memory[5],memory[6],memory[7]} <= 32'd5;
			{memory[8],memory[9],memory[10],memory[11]} <= 32'd5;
			{memory[12],memory[13],memory[14],memory[15]} <= 32'd5;
			{memory[16],memory[17],memory[18],memory[19]} <= 32'd5;
			{memory[20],memory[21],memory[22],memory[23]} <= 32'd5;
			{memory[24],memory[25],memory[26],memory[27]} <= 32'd5;
			{memory[28],memory[29],memory[30],memory[31]} <= 32'd5;
			{memory[32],memory[33],memory[34],memory[35]} <= 32'd5;
			{memory[36],memory[37],memory[38],memory[39]} <= 32'd5;
		end
		else begin
			if(memRead == 1)begin
				readData <= {memory[address],memory[address + 1],memory[address + 2],memory[address + 3]};
			end 
		end	
	end

	always @(posedge clk) begin
		if(memWrite == 1 && startin == 0)begin
                	{memory[address],memory[address + 1],memory[address + 2],memory[address + 3]} <= writeData;
		end	
	end
endmodule
