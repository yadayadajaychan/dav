module graphics_tb(
	input clk, // 50 MHz
	input rst, // active low

	output reg hsync,
	output reg vsync,
	output logic [3:0] red,
	output logic [3:0] green,
	output logic [3:0] blue
);

	wire vgaclk;
	clock_halver clock_halver1(clk, rst, vgaclk);

	reg [3:0] grid [0:15];
	reg [1:0] state;
	wire [9:0] hc;
	wire [9:0] vc;
	wire [11:0] color;

	graphics graphics1(vgaclk, rst, grid, state, hc, vc, color);

	vga vga1(vgaclk, rst, color[11:8], color[7:4], color[3:0], hc, vc, hsync, vsync, red, green, blue);

	assign grid[0] = 4'd0;
	assign grid[1] = 4'd1;
	assign grid[2] = 4'd2;
	assign grid[3] = 4'd3;
	assign grid[4] = 4'd4;
	assign grid[5] = 4'd5;
	assign grid[6] = 4'd6;
	assign grid[7] = 4'd7;
	assign grid[8] = 4'd8;
	assign grid[9] = 4'd9;
	assign grid[10] = 4'd10;
	assign grid[11] = 4'd11;
	assign grid[12] = 4'd0;
	assign grid[13] = 4'd0;
	assign grid[14] = 4'd0;
	assign grid[15] = 4'd0;

	assign state = 2'd0;

endmodule
