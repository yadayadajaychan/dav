module clock_divider (
	input wire clk, //Input Clock
	input wire speed, //Base speed in Hz
	input wire rst, //Reset Button

	output [2:0] outClk //Output Clock
);

	integer tenth = 0;
	integer fifth = 0;
	integer half = 0;

	always @(*) begin
		if (reset) begin
			tenth <= 0;
			fifth <= 0;
			half <= 0;
		end
		else begin
			if()
		end
	end

endmodule
