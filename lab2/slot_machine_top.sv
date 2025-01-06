module slot_machine_top (
	input clk,
	input start_stop_button,
	input reset_button,
	output reg [7:0] seven_seg_display [0:5],
	output reg buzzer
);
	wire enable, reset, equal;
	wire [1:0] blink;
	fsm fsm1(start_stop_button, reset_button, equal, enable, reset, blink);

	wire clk1, clk2, clk3;
	clock_divider clk_div1(clk, 20'd5, reset, clk1);
	clock_divider clk_div2(clk, 20'd10, reset, clk2);
	clock_divider clk_div3(clk, 20'd20, reset, clk3);

	wire [6:0] number1;
	wire [6:0] number2;
	wire [6:0] number3;
	lfsr lfsr1(clk1, enable, reset, number1);
	lfsr lfsr2(clk2, enable, reset, number2);
	lfsr lfsr3(clk3, enable, reset, number3);

	check_equal equal1(number1, number2, number3, equal);

	wire [3:0] bcd [0:5];
	bin_to_bcd bin_to_bcd1(number1, bcd[0], bcd[1]);
	bin_to_bcd bin_to_bcd2(number2, bcd[2], bcd[3]);
	bin_to_bcd bin_to_bcd3(number3, bcd[4], bcd[5]);

	wire display_enable;
	seven_seg_encoder enc1(bcd[0], display_enable, seven_seg_display[0]);
	seven_seg_encoder enc2(bcd[1], display_enable, seven_seg_display[1]);
	seven_seg_encoder enc3(bcd[2], display_enable, seven_seg_display[2]);
	seven_seg_encoder enc4(bcd[3], display_enable, seven_seg_display[3]);
	seven_seg_encoder enc5(bcd[4], display_enable, seven_seg_display[4]);
	seven_seg_encoder enc6(bcd[5], display_enable, seven_seg_display[5]);

	wire clk4, clk5, clk6;
	clock_divider clk_div4(clk, 20'd1, reset, clk4);
	clock_divider clk_div5(clk, 20'd2, reset, clk5);
	clock_divider clk_div6(clk, 20'd1000, reset, clk6);

	four_bit_mux mux1(1'b1, 1'b1, clk4, clk5, blink, display_enable);
	four_bit_mux mux2(1'b0, 1'b0, 1'b0, clk6, blink, buzzer);

endmodule
