`timescale 1ns / 1ps

module Lab4_Basic_3_t;
    reg clk = 1'b1;
    reg rst_n = 1'b1;
    wire [7:0] state;
    wire out;

    Lab4_Basic_3 LB(clk, rst_n, out, state);

    always # (1) clk <= ~clk;

    initial begin
        @ (negedge clk) rst_n <= 1'b0;
        @ (negedge clk) rst_n <= 1'b1;
        repeat (2 ** 8) @ (negedge clk);
        @ (negedge clk) $finish;
    end

endmodule
