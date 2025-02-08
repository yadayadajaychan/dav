module vga_top (
	input clk, // 50 MHz
	input rst,

	output logic hsync,
	output logic vsync,
	output logic [3:0] red,
	output logic [3:0] green,
	output logic [3:0] blue
);

	wire vgaclk;
	clock_divider divider1(clk, 20'd25175000, !rst, vgaclk);
	reg [7:0] color;

	localparam BLK = 8'h00;
	localparam WHT = 8'hff;
	localparam RED = 8'he0;
	localparam BLU = 8'h03;
	assign color = test_sprite[address];
	reg [7:0] test_sprite [0:767] = '{ 
	//  0       1       2      3      4      5      6      7      8      9      10     11     12     13     14     15     16     17     18     19     20     21     22     23      24      25      26     27     28     29     30     31      
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 0
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 1
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 2
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 3
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 4
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 5
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 6
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 7
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   WHT,   WHT,   RED,   RED,   RED,   RED,   WHT,   WHT,   RED,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 8
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   WHT,   WHT,   WHT,   WHT,   RED,   RED,   WHT,   WHT,   WHT,   WHT,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 9
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   WHT,   WHT,   BLU,   BLU,   RED,   RED,   WHT,   WHT,   BLU,   BLU,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 10
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   WHT,   WHT,   BLU,   BLU,   RED,   RED,   WHT,   WHT,   BLU,   BLU,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 11
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   WHT,   WHT,   RED,   RED,   RED,   RED,   WHT,   WHT,   RED,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 12
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 13
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 14
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 15
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 16
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   RED,   BLK,   RED,   RED,   RED,   BLK,   BLK,   RED,   RED,   RED,   BLK,   RED,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 17
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   RED,   BLK,   BLK,   BLK,   RED,   RED,   BLK,   BLK,   RED,   RED,   BLK,   BLK,   BLK,   RED,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 18
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 19
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 20
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 21
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   // 22
	    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,   BLK,    BLK,    BLK,    BLK,   BLK,   BLK,   BLK,   BLK,   BLK    // 23
	};

	reg [9:0] i;
	always @(posedge vgaclk) begin
		color <= test_sprite[i];
		i = i+1;
		if (i >= 768)
			i = 0;
	end

	always @(negedge rst) begin
		i <= 0;
	end

endmodule
