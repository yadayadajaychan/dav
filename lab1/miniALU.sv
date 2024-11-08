module miniALU (
	input [3:0] op1,
	input [3:0] op2,
	input operation,
	input sign,
	output reg [19:0] result
);

	// zero extend ops to 20 bits
	wire [19:0] ext_op1;
	wire [19:0] ext_op2;
	assign ext_op1 = { 16'd0, op1[3:0] };
	assign ext_op2 = { 16'd0, op2[3:0] };

	always @(*) begin
		if (operation == 1'b0) begin
			if (sign == 1'b0)
				result = ext_op1 + ext_op2;
			else
				result = ext_op1 - ext_op2;
		end else begin
			if (sign == 1'b0)
				result = ext_op1 << ext_op2;
			else
				result = ext_op1 >> ext_op2;
		end

	end

endmodule
