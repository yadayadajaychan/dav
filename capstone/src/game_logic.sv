module game_logic(
    input [3:0] direction,
    input rst,
    input clk,

    output logic [3:0] grid [0:15],
    output logic [1:0] state
);

    reg [3:0] matrix [0:15];       // 4x4 matrix stored as a 1D array
    reg [3:0] transposed [0:15];   // Output transposed matrix

    always @ (posedge clk or negedge rst) begin
        if (!rst)
            state <= 0;
        else
            case (direction)
                4'b0000: begin // No input

                end
                4'b0001: begin // Right input

                end
                4'b1000: begin // Left input

                end
                4'b0100: begin // Up input

                end
                4'b0010: begin // Down input

                end
            endcase
    end

endmodule
