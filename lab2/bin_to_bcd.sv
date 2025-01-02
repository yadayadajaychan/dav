module bin_to_bcd (
	input [6:0] number, // valid range [0,99]
	output reg [3:0] bcd0,
	output reg [3:0] bcd1
);
	always @(*) begin
		bcd0 = number % 10;
		bcd1 = number / 10;
	end

endmodule
