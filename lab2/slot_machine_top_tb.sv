module slot_machine_top_tb;
	reg clk, start_stop, reset;
	wire [7:0] seven_seg_display [0:5];
	wire buzzer;
	slot_machine_top slot_machine(clk, start_stop, reset, seven_seg_display, buzzer);

	parameter CLK_PERIOD = 20; // f = 50 MHz, T = 20 ns

	initial begin
		start_stop = 0;
		reset = 1; #10;
		reset = 0; #10;
		start_stop = 1;
	end

	initial begin
		clk = 1;
		forever #(CLK_PERIOD/2) clk = !clk;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
		for (integer i=0; i<6; i=i+1)
			$dumpvars(0, seven_seg_display[i]);
		#(CLK_PERIOD * 10) $finish;
	end

endmodule
