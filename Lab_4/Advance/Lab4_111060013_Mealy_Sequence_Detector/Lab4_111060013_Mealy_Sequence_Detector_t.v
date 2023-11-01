`timescale 1ns / 1ps

module Lab4_111060013_Mealy_Sequence_Detector_t;
    reg clk = 1'b1;
    reg rst_n = 1'b1;
    reg in;
    wire dec;

    Mealy_Sequence_Detector MSD(clk, rst_n, in, dec);

    always # (1) clk = ~clk;

    initial begin
        @ (negedge clk)
            rst_n <= 1'b0;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            rst_n <= 1'b1;
            in <= 1'b0;

        @ (negedge clk)
            $finish;

    end

endmodule
