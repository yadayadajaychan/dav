`timescale 1ns / 1ns
module miniALU_top_tb(output [7:0] displayBits [0:5]);
	reg [9:0] switches;
	//wire [7:0] displayBits [0:5];

	miniALU_top DUT(switches, displayBits);
	
		
		
	initial begin
		switches = 10'b1100001100; #10; // 12 + 3
		switches = 10'b1100001101; #10; // 12 - 3
		switches = 10'b1100001110; #10; // 12 << 3
		switches = 10'b1100001111; #10; // 12 >> 3
	end

//	initial begin
//		$dumpfile("dump.vcd");
//		for (integer i=0; i<6; i=i+1) begin
//			$dumpvars(0, displayBits[i]);
//		end
//		$dumpvars(0, switches);
//	end
endmodule
