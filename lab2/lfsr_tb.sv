`timescale 1ns / 1ns
module lfsr_tb;
	reg clk, enable, reset;
	wire [6:0] number;
	lfsr dut(clk, enable, reset, number);

	parameter CLK_PERIOD = 10;

	initial begin
		reset = 1;
		enable = 1; #5
		reset = 0; #45
		reset = 1; #5
		reset = 0; #45
		enable = 0; #50
		reset = 1; #50
		enable = 1;
		reset = 0;
	end

	initial begin
		clk = 1;
		forever #(CLK_PERIOD/2) clk = !clk;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
		#(CLK_PERIOD * 120) $finish;
	end
endmodule
