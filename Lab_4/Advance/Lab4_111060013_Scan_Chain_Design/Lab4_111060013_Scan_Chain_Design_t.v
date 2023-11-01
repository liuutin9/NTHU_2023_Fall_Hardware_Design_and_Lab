`timescale 1ns / 1ps

module Lab4_111060013_Scan_Chain_Design_t;
    reg clk = 1'b1;
    reg rst_n = 1'b1;
    reg scan_in, scan_en;
    wire scan_out;

    Scan_Chain_Design SCD(clk, rst_n, scan_in, scan_en, scan_out);

    always # (1) clk = ~clk;

    initial begin
/*
        // reset
        @ (negedge clk)
            rst_n <= 1'b0;
            scan_in <= 1'b0;
            scan_en <= 1'b0;

        // input
        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b1;
            scan_en <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b0;
            scan_en <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b1;
            scan_en <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b0;
            scan_en <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b0;
            scan_en <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b1;
            scan_en <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b0;
            scan_en <= 1'b1;

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b1;
            scan_en <= 1'b1;

        // capture
        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b0;
            scan_en <= 1'b0;

        // output
        repeat(8) begin
            @ (negedge clk)
                rst_n <= 1'b1;
                scan_in <= 1'b0;
                scan_en <= 1'b1;
        end

        @ (negedge clk)
            rst_n <= 1'b1;
            scan_in <= 1'b0;
            scan_en <= 1'b0;

        @ (negedge clk)
            $finish;
*/

        @(negedge clk)
        rst_n = 1'b0;
        @(negedge clk)
        rst_n = 1'b1;
        scan_en = 1'b1;
        scan_in = 1'b0;
        @(negedge clk)
        scan_in = 1'b0;
        @(negedge clk)
        scan_in = 1'b1;
        @(negedge clk)
        scan_in = 1'b0;
        @(negedge clk)
        scan_in = 1'b1;
        @(negedge clk)
        scan_in = 1'b0;
        @(negedge clk)
        scan_in = 1'b1;
        @(negedge clk)
        scan_in = 1'b1;
        @(negedge clk)
        scan_in = 1'b0;
        scan_en = 1'b0;
        @(negedge clk)
        scan_en = 1'b1;
        scan_in = 1'b1;
        @(negedge clk)
        scan_in = 1'b0;
        @(negedge clk)
        scan_in = 1'b0;
        @(negedge clk)
        scan_in = 1'b1;
        @(negedge clk)
        scan_in = 1'b1;
        @(negedge clk)
        scan_in = 1'b0;
        #(9*2);
        $finish;

    end

endmodule
