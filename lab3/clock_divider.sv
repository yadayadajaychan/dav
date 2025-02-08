module clock_divider(
	input clk, // 50 MHz
	input rst, // active low
	output reg outClk // 25 MHz
);

	always @(posedge clk or negedge rst) begin
		if (!rst)
			outClk <= 0;
		else
			outClk = !outClk;
	end

endmodule
