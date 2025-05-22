module game_logic(
    input [3:0] direction,
    input rst, // active low
    input clk, // 60 Hz

    output logic [3:0] grid [0:15],
    output logic [1:0] state
);

    reg [3:0] transposed [0:15];   // Output transposed matrix


 always_comb begin
        for (int i = 0; i < 16; i++) begin
            grid[i] = matrix[i];
        end
    end

    // Helper task to shift a single row to the right
    task automatic shift_row_right(input [3:0] in[4], output [3:0] out[4]);
        reg [3:0] temp [4];
        int idx;
        begin
            // Clear output
            for (int i = 0; i < 4; i++) out[i] = 0;

            // Pack non-zero values to temp from right
            idx = 3;
            for (int i = 3; i >= 0; i--) begin
                if (in[i] != 0) begin
                    temp[idx] = in[i];
                    idx -= 1;
                end
            end

            // Now merge same values
            for (int i = 3; i > 0; i--) begin
                if (temp[i] != 0 && temp[i] == temp[i-1]) begin
                    temp[i] = temp[i] + 1; // Merge by adding value
                    temp[i-1] = 0;
                end
            end

            // Pack again to the right
            idx = 3;
            for (int i = 3; i >= 0; i--) begin
                if (temp[i] != 0) begin
                    out[idx] = temp[i];
                    idx -= 1;
                end
            end
        end
    endtask

    always_ff @ (posedge clk or negedge rst) begin
        if (!rst) begin
            state <= 0;
            for (int i = 0; i < 16; i++) begin
                matrix[i] <= 0;
            end
        end else begin
            case (direction)
                4'b0000: begin // No input
                    // Do nothing
                end

                4'b0001: begin // Right
                // Divide array index by 4. If this value is the same, it means it's in the same row
                // If index%4 == 3 we check whether if it's 0, if 0 drop
                // If index%4 == 2 we check if 3 is 0 if yes, move to 3 if not leave at 2
                // If index%4 == 1 we check if 2 is 0 if yes, move to 2, then check if 3 is 0 if yes move to 3
                // If index%4 == 0 we check if 1 is 0 if yes, move to 1, then check if 2 is 0 if yes move to 2, then check if 3 is 0 if yes move to 3

                    for (int row = 0; row < 4; row++) begin
                        reg [3:0] row_in[4], row_out[4];
                        // Extract row
                        for (int col = 0; col < 4; col++) begin
                            row_in[col] = matrix[row * 4 + col];
                        end
                        shift_row_right(row_in, row_out);
                        // Save back
                        for (int col = 0; col < 4; col++) begin
                            matrix[row * 4 + col] <= row_out[col];
                        end
                    end
                    state <= 1;
                end

                4'b1000: begin // Left
                    // Similar to Right, but reverse row before and after processing
                end

                4'b0100: begin // Up
                    // You would need to extract columns and apply same logic as rows
                end

                4'b0010: begin // Down
                    // Same as Up but in reverse
                end
            endcase
        end
    end

endmodule