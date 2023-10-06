`timescale 1ns/1ps

module Carry_Look_Ahead_Adder_8bit(a, b, c0, s, c8);
    input [8-1:0] a, b;
    input c0;
    output [8-1:0] s;
    output c8;

endmodule

module CLA_Generator_4bits(a, b, cin, cout);
    input [3:0] p, g;
    input cin;
    output cout;

endmodule

module CarryCounter0(c1, a0, b0, c0);
    input a0, b0, ci0;
    output c1;
    wire p0, g0, p0_and_c0;

    Or P0(.out(p0), .a(a0), .b(b0));
    And G0(.out(g0), .a(a0), .b(b0));

    And P0AndC0(.out(p0_and_c0), .a(p0), .b(c0));
    Or OrOut(.out(c1), .a(p0_and_c0), .b(g0));

endmodule

module CarryCounter1(c2, a0, b0, a1, b1, c0);
    input a0, b0, a1, b1, c0;
    output c2;
    wire [1:0] p, g, tmp;

    Or P0(.out(p[0]), .a(a0), .b(b0));
    And G0(.out(g[0]), .a(a0), .b(b0));
    Or P1(.out(p[1]), .a(a1), .b(b1));
    And G1(.out(g[1]), .a(a1), .b(b1));

    And AndTmp0(.out(tmp[0]), .a(p[1]), .b(g[0]));
    And_3to1 AndTmp1(.out(tmp[1]), .a(p[1]), .b(p[0]), .c(c0));

    Or_3to1 OrOut(.out(c2), .a(tmp[0]), .b(tmp[1]), .c(g[1]));

endmodule

module CarryCounter2(c3, a0, b0, a1, b1, a2, b2, c0);
    input a0, b0, a1, b1, a2, b2, c0;
    output c3;
    wire [2:0] p, g, tmp;

    Or P0(.out(p[0]), .a(a0), .b(b0));
    And G0(.out(g[0]), .a(a0), .b(b0));
    Or P1(.out(p[1]), .a(a1), .b(b1));
    And G1(.out(g[1]), .a(a1), .b(b1));
    Or P2(.out(p[2]), .a(a2), .b(b2));
    And G2(.out(g[2]), .a(a2), .b(b2));

    And AndTmp0(.out(tmp[0]), .a(p[2]), .b(g[1]));
    And_3to1 AndTmp1(.out(tmp[1]), .a(p[2]), .b(p[1]), .c(g[0]));
    And_4to1 AndTmp2(.out(tmp[2]), .a(p[2]), .b(p[1]), .c(p[0]), .d(c0));

    Or_4to1 OrOut(.out(c3), .a(tmp[0]), .b(tmp[1]), .c(tmp[2]), .d(g[2]));

endmodule

module CarryCounter3(c4, a0, b0, a1, b1, a2, b2, a3, b3, c0);
    input a0, b0, a1, b1, a2, b2, a3, b3, c0;
    output c4;
    wire [3:0] p, g, tmp;

    Or P0(.out(p[0]), .a(a0), .b(b0));
    And G0(.out(g[0]), .a(a0), .b(b0));
    Or P1(.out(p[1]), .a(a1), .b(b1));
    And G1(.out(g[1]), .a(a1), .b(b1));
    Or P2(.out(p[2]), .a(a2), .b(b2));
    And G2(.out(g[2]), .a(a2), .b(b2));
    Or P3(.out(p[3]), .a(a3), .b(b3));
    And G3(.out(g[3]), .a(a3), .b(b3));

    And AndTmp0(.out(tmp[0]), .a(p[3]), .b(g[2]));
    And_3to1 AndTmp1(.out(tmp[1]), .a(p[3]), .b(p[2]), .c(g[1]));
    And_4to1 AndTmp2(.out(tmp[2]), .a(p[3]), .b(p[2]), .c(p[1]), .d(g[0]));
    And_5to1 AndTmp3(.out(tmp[2]), .a(p[3]), .b(p[2]), .c(p[1]), .d(p[0]), .e(c0));

    Or_5to1 OrOut(.out(c4), .a(tmp[0]), .b(tmp[1]), .c(tmp[2]), .d(tmp[3]), .e(g[3]));

endmodule

module Half_Adder(a, b, cout, sum);
    input a, b;
    output cout, sum;

    Xor Xor(.out(sum), .a(a), .b(b));
    And And(.out(cout), .a(a), .b(b));

endmodule

module Full_Adder (a, b, cin, cout, sum);
    input a, b, cin;
    output cout, sum;
    wire a_xor_b;

    Majority FullCarryOut(.a(a), .b(b), .c(cin), .out(cout));
    Xor AXorB(.out(a_xor_b), .a(a), .b(b));
    Xor FullSum(.out(sum), .a(a_xor_b), .b(cin));

endmodule

module Majority(a, b, c, out);
    input a, b, c;
    output out;
    wire a_and_b, a_and_c, b_and_c, tmp_or;

    And AAndB(.out(a_and_b), .a(a), .b(b));
    And AAndC(.out(a_and_c), .a(a), .b(c));
    And BAndC(.out(b_and_c), .a(b), .b(c));
    Or TmpOr(.out(tmp_or), .a(a_and_b), .b(a_and_c));
    Or Out(.out(out), .a(tmp_or), .b(b_and_c));

endmodule

module Not(out, in);
    input in;
    output out;

    nand(out, in, in);

endmodule

module Copy(out, in);
    input in;
    output out;

    And And(.out(out), .a(in), .b(1));

endmodule

module And(out, a, b);
    input a, b;
    output out;
    wire a_nand_b;

    nand(a_nand_b, a, b);
    Not Not(.out(out), .in(a_nand_b));

endmodule

module And_3to1(out, a, b, c);
    input a, b, c;
    output out;
    wire a_and_b;

    And AAndB(.out(a_and_b), .a(a), .b(b));
    And AndOut(.out(out), .a(a_and_b), .b(c));

endmodule

module And_4to1(out, a, b, c, d);
    input a, b, c, d;
    output out;
    wire a_and_b, c_and_d;

    And AAndB(.out(a_and_b), .a(a), .b(b));
    And CAndD(.out(c_and_d), .a(c), .b(d));
    And AndOut(.out(out), .a(a_and_b), .b(c_and_d));

endmodule

module And_5to1(out, a, b, c, d, e);
    input a, b, c, d, e;
    output out;
    wire abcd;

    And_4to1 AndABCD(.out(abcd), .a(a), .b(b), .c(c), .d(d));
    And AndOut(.out(out), .a(abcd), .b(e));

endmodule

module Nand(out, a, b);
    input a, b;
    output out;

    nand(out, a, b);

endmodule

module Or(out, a, b);
    input a, b;
    output out;
    wire not_a, not_b;

    Not Not_a(.out(not_a), .in(a));
    Not Not_b(.out(not_b), .in(b));
    Nand NandOut(.out(out), .a(not_a), .b(not_b));

endmodule

module Or_3to1(out, a, b, c);
    input a, b, c;
    output out;
    wire a_or_b;

    Or AOrB(.out(a_or_b), .a(a), .b(b));
    Or OrOut(.out(out), .a(a_or_b), .b(c));

endmodule

module Or_4to1(out, a, b, c, d);
    input a, b, c, d;
    output out;
    wire a_or_b, c_or_d;

    Or AOrB(.out(a_or_b), .a(a), .b(b));
    Or COrD(.out(c_or_d), .a(c), .b(d));
    Or OrOut(.out(out), .a(a_or_b), .b(c_or_d));

endmodule

module Or_5to1(out, a, b, c, d, e);
    input a, b, c, d, e;
    output out;
    wire abcd;

    Or_4to1 OrABCD(.out(abcd), .a(a), .b(b), .c(c), .d(d));
    Or OrOut(.out(out), .a(abcd), .b(e));

endmodule

module Nor(out, a, b);
    input a, b;
    output out;
    wire a_or_b;

    Or Or(.out(a_or_b), .a(a), .b(b));
    Not Not(.out(out), .in(a_or_b));

endmodule

module Xor(out, a, b);
    input a, b;
    output out;
    wire not_a, not_b, na_and_b, a_and_nb;

    Not Not_a(.out(not_a), .in(a));
    Not Not_b(.out(not_b), .in(b));

    And NA_AND_B(.out(na_and_b), .a(not_a), .b(b));
    And A_AND_NB(.out(a_and_nb), .a(a), .b(not_b));

    Or Or(.out(out), .a(na_and_b), .b(a_and_nb));

endmodule

module Xnor(out, a, b);
    input a, b;
    output out;
    wire a_xor_b;

    Xor Xor(.out(a_xor_b), .a(a), .b(b));
    Not Not(.out(out), .in(a_xor_b));

endmodule