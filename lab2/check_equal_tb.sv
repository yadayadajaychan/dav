`timescale 1ns/1ns
module check_equal_tb;
	reg [6:0] number1;
	reg [6:0] number2;
	reg [6:0] number3;
	wire equal;
	check_equal dut(number1, number2, number3, equal);

	initial begin
		number1 = 7'd100;
		number2 = 7'd100;
		number3 = 7'd100;
		#10;
		number1 = 7'd99;
		number2 = 7'd99;
		number3 = 7'd99;
		#10;
		number1 = 7'd98;
		#10;
		number2 = 7'd98;
		#10;
		number3 = 7'd98;
		#10;
		number3 = 7'd97;
		#10;
		number2 = 7'd97;
		#10;
		number1 = 7'd97;
		#10;
	end
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end
endmodule
