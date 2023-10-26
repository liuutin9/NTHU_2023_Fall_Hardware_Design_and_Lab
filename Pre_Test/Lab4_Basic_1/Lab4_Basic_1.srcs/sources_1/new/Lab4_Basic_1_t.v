`timescale 1ns / 1ps

module Lab4_Basic_1_t;
    reg clk = 1'b1;
    reg in;
    reg rst_n = 1'b1;
    wire [1:0] out;
    wire [2:0] state;

    Lab4_Basic_1 LB(in, out, clk, rst_n, state);

    always # (1) clk <= ~clk;

    initial begin
        @ (negedge clk)
            rst_n <= 1'b0;
            in <= 1'b0;
        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;
        @ (negedge clk)
            in <= 1'b0;
        @ (negedge clk)
            in <= 1'b0;
        @ (negedge clk)
            in <= 1'b1;
        @ (negedge clk)
            in <= 1'b0;
        @ (negedge clk)
            in <= 1'b1;
        @ (negedge clk);
        @ (negedge clk)
            $finish;
    end
endmodule
