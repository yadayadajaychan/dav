`timescale 1ns / 1ns
module miniALU_tb;
	reg [3:0] op1;
	reg [3:0] op2;
	reg operation, sign;
	wire [19:0] result;

	miniALU dut(op1, op2, operation, sign, result);

	task add();
	begin
		operation = 0;
		sign = 0;
	end
	endtask

	task sub();
	begin
		operation = 0;
		sign = 1;
	end
	endtask

	task left();
	begin
		operation = 1;
		sign = 0;
	end
	endtask

	task right();
	begin
		operation = 1;
		sign = 1;
	end
	endtask

	initial begin
		op1 = 4'd10; op2 = 4'd10; add(); #10;
		op1 = 4'd10; op2 = 4'd9; sub(); #10;
		op1 = 4'd10; op2 = 4'd10; left(); #10;
		op1 = 4'd10; op2 = 4'd1; right(); #10;
		op1 = 4'd10; op2 = 4'd11; sub(); #10;
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
	end

endmodule
