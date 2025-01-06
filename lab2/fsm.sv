module fsm (
	input start_stop_button,
	input reset_button,
	input equal,
	output reg enable,
	output reg reset,
	output reg [1:0] blink
);
	/* 0: reset
	 * 1: run
	 * 2: stop
	 * 3: win
	 */
	reg [1:0] state;

	always @(posedge start_stop_button or posedge reset_button) begin
		if (reset_button) begin
			state <= 2'd0;
		end else if (start_stop_button) begin
			if (state == 2'd0) begin
				state <= 2'd1;
			end else if (state == 2'd1) begin
				if (equal)
					state <= 2'd3;
				else
					state <= 2'd2;
			end else if (state == 2'd2) begin
				state <= 2'd1;
			end else begin
				state <= 2'd1;
			end
		end
	end

	always @(*) begin
		blink = state;
		case (state)
		2'd0: begin
			enable = 0;
			reset = 1;
		end
		2'd1: begin
			enable = 1;
			reset = 0;
		end
		2'd2: begin
			enable = 0;
			reset = 0;
		end
		2'd3: begin
			enable = 0;
			reset = 0;
		end
		endcase

	end

endmodule
