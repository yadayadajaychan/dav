module graphics(
	input vgaclk, // 25 MHz
	input rst, // active low

	input [3:0] grid [0:15],
	input [1:0] state,
	input [9:0] hc,
	input [9:0] vc,

	output reg [3:0] red,
	output reg [3:0] green,
	output reg [3:0] blue
);

	reg bitmap [0:3071];
	reg [11:0] palette [0:23];

	reg [6:0] x;
	reg [6:0] y;
	assign x = hc/7;
	assign y = vc/7;

	reg [3:0] block;
	assign block = x/16 + y/4;

	reg [3:0] value;
	assign value = grid[block];

	always @(posedge vgaclk) begin
		if (x >= 64 || y >= 64) begin
			red <= 0;
			green <= 0;
			blue <= 0;
		end else begin

		end
	end

	always @(negedge rst) begin
		bitmap[0] <= 0;
	end

endmodule
