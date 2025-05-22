`timescale 1ms / 1ms
module game_logic_tb;
	reg [3:0] direction;
    reg rst;
    reg clk;
	wire [3:0] grid [0:15];
    wire [1:0] state;
	game_logic dut(direction, rst, clk, grid, state);

	parameter BASE_CLK_PERIOD = 16; // f = 62.5 Hz, T = 16 ms

	initial begin
		rst = 1; #1
		rst = 0; #1
        rst = 1; #1;
	end

	initial begin
		clk = 1;
		forever #(BASE_CLK_PERIOD/2) clk = !clk;
	end

    initial begin
        direction = 4'b0001;
    
    end

	initial begin
        $dumpfile("dump.vcd");
		$dumpvars(0, rst);
        $dumpvars(0, clk);
        $dumpvars(0, direction);

        for (int i = 0; i < 16; i = i + 1)
            $dumpvars(0, grid[i]);

		#(BASE_CLK_PERIOD * 500) $finish;
	end
endmodule
