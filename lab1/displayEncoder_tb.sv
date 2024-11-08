module displayEncoder_tb;
	reg [19:0] result;
	wire [7:0] displayBits [0:5];

	displayEncoder dut(result, displayBits);

	initial begin
		result = 20'd123456; #10;
		result = 20'd789012; #10;
	end

	initial begin
		$dumpfile("dump.vcd");
		for (integer i=0; i<6; i=i+1) begin
			$dumpvars(0, displayBits[i]);
		end
		$dumpvars(0, result);
	end
endmodule
