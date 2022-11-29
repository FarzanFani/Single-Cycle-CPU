module InstructionMemory(address, instruction, startin);
	input startin;
	input [31:0] address;

	output reg [31:0] instruction;

	reg [7:0] m[0:128];

	always @(*) begin
		if(startin == 1)begin
			instruction = 32'b0;
			{m[0],m[1],m[2],m[3]} = 32'b00100000000100000000000000000000; // ADDI $s0 $zero 0(decimal)

			{m[4],m[5],m[6],m[7]} = 32'b00100000000100010000000000000000; // ADDI $s1 $zero 0(decimal)

			{m[8],m[9],m[10],m[11]} = 32'b00100000000010000000000000101000; // ADDI $t0 $zero 40(decimal)

			{m[12],m[13],m[14],m[15]} = 32'b00010010000010000000000000000100; // BEQ $s0 $t0 4(decimal)

			{m[16],m[17],m[18],m[19]} = 32'b10001110000010010000000000000000; // LW $t1 0($s0)

			{m[20],m[21],m[22],m[23]} = 32'b00000010001010011000100000100000; // ADD $s1 $s1 $t1

			{m[24],m[25],m[26],m[27]} = 32'b00100010000100000000000000000100; // ADDI $s0 $s0 4(decimal)

			{m[28],m[29],m[30],m[31]} = 32'b00001000000000000000000000000011; // J 3

			{m[32],m[33],m[34],m[35]} = 32'b10101101000100010000000000000000; // SW $s1 0($t0)

			{m[36],m[37],m[38],m[39]} <= 32'b10001101000100100000000000000000;

			{m[40],m[41],m[42],m[43]} <= 32'b00001000000000000000000000001010;
			
		end 
		else begin
			instruction = {m[address], m[address + 1], m[address + 2], m[address + 3]};
		end
	end

endmodule
