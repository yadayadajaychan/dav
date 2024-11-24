module clock_divider (
	input clk, // Input Clock
	input [19:0] speed, // Desired speed (Hz)
	input rst, // Reset Button

	output reg outClk // Output Clock
);

	parameter BASE_SPEED = 50_000_000;
	reg [24:0] counter;
	reg [24:0] max_val;

	always @(*) begin
		max_val = BASE_SPEED / (speed * 2);
	end

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			counter = 0;
			outClk = 0;
		end else begin
			if (counter == 0)
				outClk = !outClk;

			counter += 1;

			if (counter == max_val)
				counter = 0;
		end
	end

endmodule
