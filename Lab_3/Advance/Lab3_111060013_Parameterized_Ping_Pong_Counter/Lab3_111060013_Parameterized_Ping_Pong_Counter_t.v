`timescale 1ns / 1ps

module Lab3_111060013_Parameterized_Ping_Pong_Counter_t;
    reg clk = 1'b1;
    reg rst_n = 1'b1;
    reg enable;
    reg flip;
    reg [4-1:0] max;
    reg [4-1:0] min;
    wire direction;
    wire [4-1:0] out;

    Parameterized_Ping_Pong_Counter PPPC(
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .flip(flip),
        .max(max),
        .min(min),
        .direction(direction),
        .out(out)
    );

    always # (1) clk = ~clk;

    initial begin
        #1 rst_n <= 1'b0;
           max <= 4'b0100;
           min <= 4'b0000;
        #2 rst_n <= 1'b1;
           enable <= 1'b1;
           flip <= 1'b0;
        #50 flip <= 1'b1;
        #6 flip <= 1'b0;
        #50 enable <= 1'b0;
        #4 $finish; 
    end

endmodule
