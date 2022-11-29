module Control(instruction31_26, regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);
	input [5:0] instruction31_26;
	output reg regdst;
	output reg jump;
	output reg branch;
	output reg memread;
	output reg memtoreg;
	output reg memwrite;
	output reg alusrc;
	output reg regwrite;
	output reg [1:0] aluop;

	always @(*) begin
		case(instruction31_26)
		6'b100011: begin // lw
			regdst = 0;
			jump = 0;
			branch = 0;
			memread = 1;
			memtoreg = 1;
			memwrite = 0;
			alusrc = 1;
			regwrite = 1;
			aluop = 2'b00;
		end
		6'b101011: begin // sw
			regdst = 0;
			jump = 0;
			branch = 0;
			memread = 0;
			memtoreg = 0;
			memwrite = 1;
			alusrc = 1;
			regwrite = 0;
			aluop = 2'b00;
		end
		6'b000100: begin // beq
			regdst = 0;
			jump = 0;
			branch = 1;
			memread = 0;
			memtoreg = 0;
			memwrite = 0;
			alusrc = 0;
			regwrite = 0;
			aluop = 2'b01;
		end
		6'b000010: begin // jump
			regdst = 0;
			jump = 1;
			branch = 0;
			memread = 0;
			memtoreg = 0;
			memwrite = 0;
			alusrc = 0;
			regwrite = 0;
			aluop = 2'b00;
		end	
		6'b001000: begin // addi
			regdst = 0;
			jump = 0;
			branch = 0;
			memread = 0;
			memtoreg = 0;
			memwrite = 0;
			alusrc = 1;
			regwrite = 1;
			aluop = 2'b00;
		end
		6'b000000: begin // add, and, ...
			regdst = 1;
			jump = 0;
			branch = 0;
			memread = 0;
			memtoreg = 0;
			memwrite = 0;
			alusrc = 0;
			regwrite = 1;
			aluop = 2'b10;
		end
		endcase
	end
endmodule
