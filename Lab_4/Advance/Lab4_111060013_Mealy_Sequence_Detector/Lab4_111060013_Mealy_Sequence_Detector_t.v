`timescale 1ns / 1ps

module Lab4_111060013_Mealy_Sequence_Detector_t;
    reg clk = 1'b1;
    reg rst_n = 1'b1;
    reg in = 1'b0;
    wire dec;
    reg [3:0] counter = 4'd0; // 系傳

    Mealy_Sequence_Detector MSD(clk, rst_n, in, dec);

    always # (1) clk = ~clk;

    initial begin
/*
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
*/
        @(negedge clk)
        rst_n = 1'b0;
        @(negedge clk)
        rst_n = 1'b1;
        in = 1'b0;
        @(negedge clk)
        in = 1'b1;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        in = 1'b0;
        @(negedge clk)
        in = 1'b1;
        @(negedge clk)
        @(negedge clk)
        in = 1'b0;
        @(negedge clk)
        in = 1'b1;
        @(negedge clk)
        in = 1'b0;
        @(negedge clk)
        @(negedge clk)
        in = 1'b1;
        @(negedge clk)
        in = 1'b0;
        @(negedge clk)
        in = 1'b1;
        @(negedge clk)
        in = 1'b0;
        @(negedge clk)
        @(negedge clk)
        repeat(16) begin
            in = counter[0];
            @(posedge clk)
            in = counter[1];
            @(posedge clk)
            in = counter[2];
            @(posedge clk)
            in = counter[3];
            @(posedge clk)
            counter = counter + 1'b1;
        end
        @(negedge clk)
        $finish;
    end

endmodule
