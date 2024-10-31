module miniALU_top (
	// TODO: define your input and output ports
	input [9:0] in,
	output [9:0] out
);

    // The following block contains the logic of your combinational circuit
    always_comb begin
        // TODO: write the logic for your miniALU here
		  out = in;
    end
endmodule