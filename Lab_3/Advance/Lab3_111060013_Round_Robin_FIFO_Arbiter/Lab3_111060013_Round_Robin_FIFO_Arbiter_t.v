/*
`timescale 1ns / 1ps

module Lab3_111060013_Round_Robin_FIFO_Arbiter_t;
    reg clk = 1'b1;
    reg rst_n = 1'b1;
    reg [3:0] wen;
    reg [7:0] a, b, c, d;
    wire valid;
    wire [7:0] dout;

    Round_Robin_FIFO_Arbiter RRFA(
        .clk(clk),
        .rst_n(rst_n),
        .wen(wen),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .dout(dout),
        .valid(valid)
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
           a <= 8'd0;
           b <= 8'd0;
           c <= 8'd0;
           d <= 8'd85;
        #2 wen <= 4'b0100;
           c <= 8'd139;
           d <= 8'd0;
        #2 wen <= 4'b0000;
           c <= 8'd0;
        #2 wen <= 4'b0000;
        #2 wen <= 4'b0000;
        #2 wen <= 4'b0001;
           a <= 8'd51;
        #2 wen <= 4'b0000;
           a <= 8'd0;
        #4 wen <= 4'b0000;
        #2 $finish;
    end

endmodule
*/

`timescale 1ns / 1ps

module Lab3_Team30_Round_Robin_Arbiter_t;
reg clk = 1'b1, rst_n = 1'b1;
reg [3:0] wen;
reg [7:0] a, b, c, d;
wire [7:0] dout;
wire valid;

Round_Robin_FIFO_Arbiter r (clk, rst_n, wen, a, b, c, d, dout, valid);
always#(5) clk = ~clk;

initial begin
@(negedge clk)
    rst_n = 1'b0;
    wen = 4'b1111;
@(negedge clk)
    rst_n = 1'b1;
    wen = 4'b1111;
    a = 8'b10000111;
    b = 8'b01010110;
    c = 8'b00001001;
    d = 8'b00010011;
@(negedge clk)
    wen = 4'b1000;
    a = 8'bx;
    b = 8'bx;
    c = 8'bx;
    d = 8'b10000101;
@(negedge clk)
    wen = 4'b0100;
    c = 8'b11011001;
    d = 8'bx;
@(negedge clk)
    wen = 4'b0000;
    c = 8'bx;
@(negedge clk)
@(negedge clk)
@(negedge clk)
    wen = 4'b0001;
    a = 8'b01010001;
@(negedge clk)
    wen = 4'b0000;
    a = 8'bx;
@(negedge clk)
@(negedge clk)
@(negedge clk)
@(negedge clk)
repeat(9)begin
@(negedge clk)
    wen = 4'b1111;
    a = 8'd10;
    b = 8'd20;
    c = 8'd30;
    d = 8'd40;
    end
repeat(34)begin
@(negedge clk)
    wen = 4'b0;
    a = 8'dx;
    b = 8'dx;
    c = 8'dx;
    d = 8'dx;
    end
@(negedge clk)
@(negedge clk)
@(negedge clk)
    $finish;
 end   
endmodule
