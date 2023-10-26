`timescale 1ns / 1ps

module Lab4_Basic_3(clk, rst_n, out, state);
    input clk, rst_n;
    output wire out;
    output reg [7:0] state;
    wire in;

    always @ (posedge clk) begin
        if (!rst_n) state <= 8'b10111101;
        else state <= {state[6:0], in};
    end

    assign out = state[7];
    assign in = (state[1] ^ state[2]) ^ (state[3] ^ state[7]);

endmodule
