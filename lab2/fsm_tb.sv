`timescale 1ns/1ns
module fsm_tb;
	reg start_stop_button, reset_button, equal;
	wire enable, reset;
	wire [1:0] blink;
	fsm dut(start_stop_button, reset_button, equal, enable, reset, blink);

	initial begin
		start_stop_button = 0; reset_button = 0; equal = 0; #10;

		start_stop_button = 0; reset_button = 1; equal = 0; #10;
		start_stop_button = 0; reset_button = 0; equal = 0; #10;

		start_stop_button = 1; reset_button = 0; equal = 0; #10;
		start_stop_button = 0; reset_button = 0; equal = 0; #10;

		start_stop_button = 1; reset_button = 0; equal = 0; #10;
		start_stop_button = 0; reset_button = 0; equal = 0; #10;

		start_stop_button = 1; reset_button = 0; equal = 0; #10;
		start_stop_button = 0; reset_button = 0; equal = 0; #10;

		start_stop_button = 1; reset_button = 0; equal = 1; #10;
		start_stop_button = 0; reset_button = 0; equal = 1; #10;

		start_stop_button = 1; reset_button = 0; equal = 1; #10;
		start_stop_button = 1; reset_button = 1; equal = 1; #10;
		start_stop_button = 0; reset_button = 0; equal = 0; #10;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end
endmodule
