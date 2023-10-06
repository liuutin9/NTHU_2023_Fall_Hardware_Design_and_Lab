`timescale 1ns / 1ps

module Lab2_111060013_Ripple_Carry_Adder_t;
    reg [7:0] a = 8'b00001010;
    reg [7:0] b = 8'b00001011;
    reg cin = 1'b0;
    wire [7:0] sum;
    wire cout;

    Ripple_Carry_Adder RCA(
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        #1 cin = 1;
        #1 a <= 8'b11111111;
           b <= 8'b00000001;
           cin <= 1'b0;
        #1 cin <= 1'b1;
        #1 $finish;
    end
endmodule