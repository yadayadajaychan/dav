`timescale 1ns / 1ns
module clock_divider_tb;
	reg clk;
	reg [19:0] speed;
	reg rst;
	wire outClk;
	clock_divider dut(clk, speed, rst, outClk);

	parameter BASE_CLK_PERIOD = 20; // f = 50 MHz, T = 20 ns

	initial begin
		rst = 0;
		speed = 1_000_000; #1
		rst = 1; #1
		rst = 0;
	end

	initial begin
		clk = 1;
		forever #(BASE_CLK_PERIOD/2) clk = !clk;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
		#(BASE_CLK_PERIOD * 500) $finish;
	end
endmodule
