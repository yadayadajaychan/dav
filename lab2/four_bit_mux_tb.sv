module four_bit_mux_tb;
	reg in0, in1, in2, in3;
	reg [1:0] sel;
	wire out;
	four_bit_mux dut(in0, in1, in2, in3, sel, out);

	initial begin
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd0; #10;
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd1; #10;
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd2; #10;
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd3; #10;
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd0; #10;
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd1; #10;
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd2; #10;
		in0=1'd0; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd3; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd0; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd1; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd2; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd3; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd0; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd1; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd2; #10;
		in0=1'd0; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd3; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd0; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd1; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd2; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd3; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd0; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd1; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd2; #10;
		in0=1'd0; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd3; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd0; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd1; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd2; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd3; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd0; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd1; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd2; #10;
		in0=1'd0; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd3; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd0; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd1; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd2; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd0; sel=2'd3; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd0; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd1; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd2; #10;
		in0=1'd1; in1=1'd0; in2=1'd0; in3=1'd1; sel=2'd3; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd0; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd1; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd2; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd0; sel=2'd3; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd0; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd1; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd2; #10;
		in0=1'd1; in1=1'd0; in2=1'd1; in3=1'd1; sel=2'd3; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd0; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd1; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd2; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd0; sel=2'd3; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd0; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd1; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd2; #10;
		in0=1'd1; in1=1'd1; in2=1'd0; in3=1'd1; sel=2'd3; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd0; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd1; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd2; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd0; sel=2'd3; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd0; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd1; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd2; #10;
		in0=1'd1; in1=1'd1; in2=1'd1; in3=1'd1; sel=2'd3; #10;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end
endmodule
