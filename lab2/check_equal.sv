module check_equal (
	input [6:0] number1,
	input [6:0] number2,
	input [6:0] number3,
	output reg equal
);
	always @(*) begin
		if (number1 == number2 && number2 == number3)
			equal = 1'b1;
		else
			equal = 1'b0;
	end

endmodule
