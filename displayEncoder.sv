module displayEncoder(
	input [19:0] result,
	output reg [7:0] displayBits [0:5]
);
	reg [19:0] tmp;
	reg [3:0] bcd [0:5];

	sevenSegDigit digit0(bcd[0], displayBits[0]);
	sevenSegDigit digit1(bcd[1], displayBits[1]);
	sevenSegDigit digit2(bcd[2], displayBits[2]);
	sevenSegDigit digit3(bcd[3], displayBits[3]);
	sevenSegDigit digit4(bcd[4], displayBits[4]);
	sevenSegDigit digit5(bcd[5], displayBits[5]);

	always @(*) begin
		tmp = result;
		for (integer i = 0; i < 6; i = i + 1) begin
			bcd[i] = tmp % 10;
			tmp = tmp / 10;
		end
	end
endmodule
