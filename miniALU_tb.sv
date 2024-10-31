`timescale 1ns / 1ns
module miniALU_tb;
	logic [9:0] switches;
	logic [9:0] leds;
	
	miniALU_top DUT(switches, leds);
	
	initial begin
		switches = 10'b0000000000; #10
		switches = 10'b1111111111; #10;
	end
endmodule
	