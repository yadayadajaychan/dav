module miniALU_top (
	// TODO: define your input and output ports
	input [9:0] in,
	output logic [7:0] displayBits [0:5]
);
	wire [19:0] result;
	miniALU ALU(in[9:6], in[5:2], in[1], in[0], result);
	displayEncoder disp(result, displayBits);
endmodule
