module game_logic(
    input [3:0] direction,
    input rst,
    input clk,
    output reg [3:0] grid [0:15],
    output reg [1:0] state
);

    reg [3:0] matrix [0:15];  // Internal game grid (4x4 stored as 1D)

    integer i;

    // Shift a row to the right (no merging)
    task shift_row_right;
        input [3:0] base_index; // row * 4
        reg [3:0] row[0:3];
        reg [3:0] temp[0:3];
        reg [3:0] result[0:3];
        integer k, t;

        begin
            // Step 1: Read the row
            for (k = 0; k < 4; k = k + 1)
                row[k] = matrix[base_index + k];

            // Step 2: Shift non-zero values to the right (compact)
            for (k = 0; k < 4; k = k + 1)
                temp[k] = 0;
            t = 3;
            for (k = 3; k >= 0; k = k - 1) begin
                if (row[k] != 0) begin
                    temp[t] = row[k];
                    t = t - 1;
                end
            end

            // Step 3: Merge identical adjacent tiles
            for (k = 3; k > 0; k = k - 1) begin
                if (temp[k] != 0 && temp[k] == temp[k-1]) begin
                    temp[k] = temp[k] + 1;  // Merge: log2(2*val)
                    temp[k-1] = 0;
                end
            end

            // Step 4: Shift again to remove new gaps
            for (k = 0; k < 4; k = k + 1)
                result[k] = 0;
            t = 3;
            for (k = 3; k >= 0; k = k - 1) begin
                if (temp[k] != 0) begin
                    result[t] = temp[k];
                    t = t - 1;
                end
            end

            // Step 5: Write back to matrix
            for (k = 0; k < 4; k = k + 1)
                matrix[base_index + k] = result[k];
        end
    endtask

    // Sequential logic
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            state <= 0;
            for (i = 0; i < 16; i = i + 1)
                matrix[i] <= 0;
        end else begin
            case (direction)
                4'b0000: begin
                    // Do nothing
                end

                4'b0001: begin // Right
                    shift_row_right(0);
                    shift_row_right(4);
                    shift_row_right(8);
                    shift_row_right(12);
                    state <= 1;
                end

                4'b1000: begin // Left
                    // To be implemented: same as right, but reverse, shift, reverse
                    // Reflect and perform right
                end

                4'b0100: begin // Up
                    // To be implemented: column-wise processing
                    // Transpose and Reflect and right
                end

                4'b0010: begin // Down
                    // To be implemented: column-wise processing
                    // Transpose and right
                end

                default: begin
                    // Handle invalid input if necessary
                end
            endcase
        end
    end

    // Copy matrix to grid output
    always @(posedge clk) begin
        for (i = 0; i < 16; i = i + 1)
            grid[i] <= matrix[i];
    end

endmodule