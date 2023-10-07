`timescale 1ns/1ps

module Multiplier_4bit(a, b, p);
input [4-1:0] a, b;
output [8-1:0] p;

endmodule

module Half_Adder(a, b, cout, sum);
    input a, b;
    output cout, sum;

    Xor Xor(sum, a, b);
    And And(cout, a, b);

endmodule

module Full_Adder (a, b, cin, cout, sum);
    input a, b, cin;
    output cout, sum;
    wire a_xor_b;

    Majority FullCarryOut(a, b, cin, cout);
    Xor AXorB(a_xor_b, a, b);
    Xor FullSum(sum, a_xor_b, cin);

endmodule

module Majority(a, b, c, out);
    input a, b, c;
    output out;
    wire a_and_b, a_and_c, b_and_c, tmp_or;

    And AAndB(a_and_b, a, b);
    And AAndC(a_and_c, a, c);
    And BAndC(b_and_c, b, c);
    Or TmpOr(tmp_or, a_and_b, a_and_c);
    Or Out(out, tmp_or, b_and_c);

endmodule

module Mux_2to1(out, in0, in1, sel);
    input in0, in1, sel;
    output out;
    wire not_sel, tmp0, tmp1;

    Not Not(not_sel, sel);

    And And0(tmp0, in0, not_sel);
    And And1(tmp1, in1, sel);

    Or Or(out, tmp0, tmp1);

endmodule

module Mux_4to1(out, in0, in1, in2, in3, sel);
    input in0, in1, in2, in3;
    input [1:0] sel;
    output out;
    wire tmp0, tmp1;

    Mux_2to1 Mux0(tmp0, in0, in2, sel[1]);
    Mux_2to1 Mux1(tmp1, in1, in3, sel[1]);

    Mux_2to1 MuxOut(out, tmp0, tmp1, sel[0]);

endmodule

module Mux_8to1(out, in0, in1, in2, in3, in4, in5, in6, in7, sel);
    input in0, in1, in2, in3, in4, in5, in6, in7;
    input [2:0] sel;
    output out;
    wire tmp0, tmp1;

    Mux_4to1 Mux0(tmp0, in0, in2, in4, in6, sel[2:1]);
    Mux_4to1 Mux1(tmp1, in1, in3, in5, in7, sel[2:1]);

    Mux_2to1 MuxOut(out, tmp0, tmp1, sel[0]);

endmodule

module Not(out, in);
    input in;
    output out;

    nand(out, in, in);

endmodule

module And(out, a, b);
    input a, b;
    output out;
    wire a_nand_b;

    nand(a_nand_b, a, b);
    Not Not(out, a_nand_b);

endmodule

module Or(out, a, b);
    input a, b;
    output out;
    wire not_a, not_b;

    Not Not_a(not_a, a);
    Not Not_b(not_b, b);
    nand(out, not_a, not_b);

endmodule

module Nor(out, a, b);
    input a, b;
    output out;
    wire a_or_b;

    Or Or(a_or_b, a, b);
    Not Not(out, a_or_b);

endmodule

module Xor(out, a, b);
    input a, b;
    output out;
    wire not_a, not_b, na_and_b, a_and_nb;

    Not Not_a(not_a, a);
    Not Not_b(not_b, b);

    And NA_AND_B(na_and_b, not_a, b);
    And A_AND_NB(a_and_nb, a, not_b);

    Or Or(out, na_and_b, a_and_nb);

endmodule

module Xnor(out, a, b);
    input a, b;
    output out;
    wire a_xor_b;

    Xor Xor(a_xor_b, a, b);
    Not Not(out, a_xor_b);

endmodule