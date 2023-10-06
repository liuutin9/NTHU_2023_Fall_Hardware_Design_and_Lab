`timescale 1ns / 1ps

module Lab2_111060013_Carry_Look_Ahead_Adder_8bit_t;
    reg [7:0] a = 8'b00001010;
    reg [7:0] b = 8'b00001011;
    reg c0 = 1'b0;
    wire [7:0] s;
    wire c8;

    Carry_Look_Ahead_Adder_8bit CLAA8(
        .a(a),
        .b(b),
        .c0(c0),
        .s(s),
        .c8(c8)
    );

    initial begin
        #1 c0 = 1;
        #1 a <= 8'b11111111;
           b <= 8'b00000001;
           c0 <= 1'b0;
        #1 c0 <= 1'b1;
        #1 $finish;
    end

endmodule
