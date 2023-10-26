`timescale 1ns / 1ps

module Lab4_Basic_4(clk, rst_n, state, out);
    input clk, rst_n;
    output reg [7:0] state;
    output wire out;

    assign out = state[7];

    always @ (posedge clk) begin
        if (!rst_n) begin
            state <= 8'b10111101;
        end
        else begin
            state[0] <= state[7];
            state[1] <= state[0];
            state[2] <= state[1] ^ state[7];
            state[3] <= state[2] ^ state[7];
            state[4] <= state[3] ^ state[7];
            state[5] <= state[4];
            state[6] <= state[5];
            state[7] <= state[6];
        end
    end

endmodule
