`timescale 1ns / 1ps

module Lab3_111060013_Round_Robin_FIFO_Arbiter_t;
    reg clk = 1'b1;
    reg rst_n = 1'b1;
    reg [3:0] wen;
    reg [7:0] a, b, c, d;
    wire valid;
    wire [7:0] dout;
    wire [3:0] ren;
    wire err_a, err_b, err_c, err_d;

    Round_Robin_FIFO_Arbiter RRFA(
        .clk(clk),
        .rst_n(rst_n),
        .wen(wen),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .dout(dout),
        .valid(valid),
        .ren(ren),
        .err_a(err_a),
        .err_b(err_b),
        .err_c(err_c),
        .err_d(err_d)
    );

    always # (1) clk = ~clk;

    initial begin
        #1 rst_n <= 1'b0;
        #2 rst_n <= 1'b1;
           wen <= 4'b1111;
           a <= 8'd87;
           b <= 8'd56;
           c <= 8'd9;
           d <= 8'd13;
        #2 wen <= 4'b1000;
           d <= 8'd85;
        #2 wen <= 4'b0100;
           c <= 8'd139;
        #2 wen <= 4'b0000;
        #2 wen <= 4'b0000;
        #2 wen <= 4'b0000;
        #2 wen <= 4'b0001;
           a <= 8'd51;
        #2 wen <= 4'b0000;
        #2 wen <= 4'b0000;
        #2 $finish;
    end

endmodule
