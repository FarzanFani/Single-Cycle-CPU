module ALUControl(func, aluop, aluControl);
	input [5:0] func;
	input [1:0] aluop;
	output reg [3:0] aluControl;

	always @(*) begin
		if(aluop == 0)begin
			aluControl = 4'b0010;
		end
		else if(aluop == 1) begin
			aluControl = 4'b0110;
		end
		else begin
		case(func)
			6'b100000: aluControl = 4'b0010;
			6'b100010: aluControl = 4'b0110;
			6'b100100: aluControl = 4'b0000;
			6'b100101: aluControl = 4'b0001;
			6'b101010: aluControl = 4'b0111;
			//Nor
		default: aluControl = 4'b0000;
		endcase
		end
	end
endmodule
