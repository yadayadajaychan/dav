`timescale 1ns/1ns
module seven_seg_encoder_tb;
	reg [3:0] bcd;
	reg enable;
	wire [7:0] displayBits;
	seven_seg_encoder dut(bcd, enable, displayBits);

	initial begin
		enable = 1;
		bcd = 8; #10
		enable = 0; #10;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end

endmodule
