module lfsr (
	input clk,
	input enable, // active high
	input reset,  // active high
	output reg [6:0] number
);

	reg [15:0] state;
	reg next_bit;

	always @(*) begin
		next_bit = !(state[15] ^ state[13] ^ state[12] ^ state[10]);
		number = state % 100;
	end

	always @(posedge clk or posedge reset) begin
		if (reset)
			state <= 0;
		else if (enable)
			state <= (state << 1) | next_bit;
	end

endmodule
