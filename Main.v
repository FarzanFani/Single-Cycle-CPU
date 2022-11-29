module Main(startin, regNo, val, clk);
	input startin;
	input [4:0] regNo;
	input clk;
	output [31:0] val;


	wire alusrc;
	wire regdst, jump, branch, memread, memtoreg, memwrite, regwrite;
	wire [1:0] aluop;


	wire[31:0]addressOfBranch, pcIn, pcOut, insOut, writeData, ReadData1, ReadData2, signExOut, aluOut, ReadDataOut, shiftL2Out,
					addRes, finalAddRes, afterFinalAddOut;

	wire [3:0] aluControlOut;

	PC pc(pcOut,pcIn,clk,startin);
	
	InstructionMemory insMemory(pcOut,insOut,startin);

	Control control(insOut[31:26],regdst,jump,branch,memread,memtoreg,aluop,memwrite,alusrc,regwrite);

	wire[4:0]mux5Out;
	mux_5 mux5(insOut[20:16],insOut[15:11],regdst,mux5Out);

	registerFile registerFile(insOut[25:21],insOut[20:16],mux5Out,writeData,regwrite,ReadData1,ReadData2,startin,clk,val,regNo);

	ALUControl aluControl(insOut[5:0],aluop, aluControlOut);
	
	SignExtend signEx(insOut[15:0],signExOut);
	
	wire [31:0] mux32Out;
	mux_32 mux32(ReadData2,signExOut,alusrc,mux32Out);
	
	wire zero;
	ALU alu(ReadData1,mux32Out,aluControlOut,aluOut,zero);
	
	DataMemory dataMemory(aluOut,ReadData2,memwrite,memread,ReadDataOut,startin,clk);

	mux_32 muxMemToReg(aluOut,ReadDataOut,memtoreg,writeData);

	shiftleft2 shiftleft2(signExOut,shiftL2Out);

	and(resBranch,branch,zero);

	Add adder(pcOut,32'b00000000000000000000000000000100,addRes);

	wire [27:0] shiftLeft_26_28_Res;
	shift_26_28 shiftLeft_26_28(insOut[25:0],shiftLeft_26_28_Res);

	Add add(addRes,shiftL2Out,finalAddRes);

	mux_32 afterFinalAdd(addRes,finalAddRes,resBranch,afterFinalAddOut);

	assign addressOfBranch ={addRes[31:28],shiftLeft_26_28_Res};
	mux_32 TotalFinalMux(afterFinalAddOut,addressOfBranch,jump,pcIn);	
endmodule