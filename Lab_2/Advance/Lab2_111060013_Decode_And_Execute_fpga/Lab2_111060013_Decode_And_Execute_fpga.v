`timescale 1ns/1ps

module Center(rt, rs, sel, display);
    input [3:0] rt, rs;
    input [2:0] sel;
    output [7:0] display;
    wire [3:0] rd_display;

    Decode_And_Execute DAE(.rt(rt), .rs(rs), .sel(sel), .rd(rd_display));
    Segment7_Display Display(.in(rd_display), .out(display));

endmodule

module Segment7_Display(in, out);
    input [3:0] in;
    output [7:0] out;
    wire [7:0] zero, one, two, three, four, five, six, seven, eight, nine, a, b, c, d, e, f;
    wire [7:0] tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmpa, tmpb, tmpc, tmpd, tmpe, tmpf;
    wire [15:0] sig;

    Or_16to1 O0(
        .out(out[0]),
        .a(tmp0[0]),
        .b(tmp1[0]),
        .c(tmp2[0]),
        .d(tmp3[0]),
        .e(tmp4[0]),
        .f(tmp5[0]),
        .g(tmp6[0]),
        .h(tmp7[0]),
        .i(tmp8[0]),
        .j(tmp9[0]),
        .k(tmpa[0]),
        .l(tmpb[0]),
        .m(tmpc[0]),
        .n(tmpd[0]),
        .o(tmpe[0]),
        .p(tmpf[0])
    );
    Or_16to1 O1(
        .out(out[1]),
        .a(tmp0[1]),
        .b(tmp1[1]),
        .c(tmp2[1]),
        .d(tmp3[1]),
        .e(tmp4[1]),
        .f(tmp5[1]),
        .g(tmp6[1]),
        .h(tmp7[1]),
        .i(tmp8[1]),
        .j(tmp9[1]),
        .k(tmpa[1]),
        .l(tmpb[1]),
        .m(tmpc[1]),
        .n(tmpd[1]),
        .o(tmpe[1]),
        .p(tmpf[1])
    );
    Or_16to1 O2(
        .out(out[2]),
        .a(tmp0[2]),
        .b(tmp1[2]),
        .c(tmp2[2]),
        .d(tmp3[2]),
        .e(tmp4[2]),
        .f(tmp5[2]),
        .g(tmp6[2]),
        .h(tmp7[2]),
        .i(tmp8[2]),
        .j(tmp9[2]),
        .k(tmpa[2]),
        .l(tmpb[2]),
        .m(tmpc[2]),
        .n(tmpd[2]),
        .o(tmpe[2]),
        .p(tmpf[2])
    );
    Or_16to1 O3(
        .out(out[3]),
        .a(tmp0[3]),
        .b(tmp1[3]),
        .c(tmp2[3]),
        .d(tmp3[3]),
        .e(tmp4[3]),
        .f(tmp5[3]),
        .g(tmp6[3]),
        .h(tmp7[3]),
        .i(tmp8[3]),
        .j(tmp9[3]),
        .k(tmpa[3]),
        .l(tmpb[3]),
        .m(tmpc[3]),
        .n(tmpd[3]),
        .o(tmpe[3]),
        .p(tmpf[3])
    );
    Or_16to1 O4(
        .out(out[4]),
        .a(tmp0[4]),
        .b(tmp1[4]),
        .c(tmp2[4]),
        .d(tmp3[4]),
        .e(tmp4[4]),
        .f(tmp5[4]),
        .g(tmp6[4]),
        .h(tmp7[4]),
        .i(tmp8[4]),
        .j(tmp9[4]),
        .k(tmpa[4]),
        .l(tmpb[4]),
        .m(tmpc[4]),
        .n(tmpd[4]),
        .o(tmpe[4]),
        .p(tmpf[4])
    );
    Or_16to1 O5(
        .out(out[5]),
        .a(tmp0[5]),
        .b(tmp1[5]),
        .c(tmp2[5]),
        .d(tmp3[5]),
        .e(tmp4[5]),
        .f(tmp5[5]),
        .g(tmp6[5]),
        .h(tmp7[5]),
        .i(tmp8[5]),
        .j(tmp9[5]),
        .k(tmpa[5]),
        .l(tmpb[5]),
        .m(tmpc[5]),
        .n(tmpd[5]),
        .o(tmpe[5]),
        .p(tmpf[5])
    );
    Or_16to1 O6(
        .out(out[6]),
        .a(tmp0[6]),
        .b(tmp1[6]),
        .c(tmp2[6]),
        .d(tmp3[6]),
        .e(tmp4[6]),
        .f(tmp5[6]),
        .g(tmp6[6]),
        .h(tmp7[6]),
        .i(tmp8[6]),
        .j(tmp9[6]),
        .k(tmpa[6]),
        .l(tmpb[6]),
        .m(tmpc[6]),
        .n(tmpd[6]),
        .o(tmpe[6]),
        .p(tmpf[6])
    );
    Or_16to1 O7(
        .out(out[7]),
        .a(tmp0[7]),
        .b(tmp1[7]),
        .c(tmp2[7]),
        .d(tmp3[7]),
        .e(tmp4[7]),
        .f(tmp5[7]),
        .g(tmp6[7]),
        .h(tmp7[7]),
        .i(tmp8[7]),
        .j(tmp9[7]),
        .k(tmpa[7]),
        .l(tmpb[7]),
        .m(tmpc[7]),
        .n(tmpd[7]),
        .o(tmpe[7]),
        .p(tmpf[7])
    );

    AndSelect_8bits AS0(.out(tmp0), .in(zero), .sel(sig[0]));
    AndSelect_8bits AS1(.out(tmp1), .in(one), .sel(sig[1]));
    AndSelect_8bits AS2(.out(tmp2), .in(two), .sel(sig[2]));
    AndSelect_8bits AS3(.out(tmp3), .in(three), .sel(sig[3]));
    AndSelect_8bits AS4(.out(tmp4), .in(four), .sel(sig[4]));
    AndSelect_8bits AS5(.out(tmp5), .in(five), .sel(sig[5]));
    AndSelect_8bits AS6(.out(tmp6), .in(six), .sel(sig[6]));
    AndSelect_8bits AS7(.out(tmp7), .in(seven), .sel(sig[7]));
    AndSelect_8bits AS8(.out(tmp8), .in(eight), .sel(sig[8]));
    AndSelect_8bits AS9(.out(tmp9), .in(nine), .sel(sig[9]));
    AndSelect_8bits ASA(.out(tmpa), .in(a), .sel(sig[10]));
    AndSelect_8bits ASB(.out(tmpb), .in(b), .sel(sig[11]));
    AndSelect_8bits ASC(.out(tmpc), .in(c), .sel(sig[12]));
    AndSelect_8bits ASD(.out(tmpd), .in(d), .sel(sig[13]));
    AndSelect_8bits ASE(.out(tmpe), .in(e), .sel(sig[14]));
    AndSelect_8bits ASF(.out(tmpf), .in(f), .sel(sig[15]));

    CompareEQ_4bits CEQ0(.out(sig[0]), .a(in), .b(4'b0000));
    CompareEQ_4bits CEQ1(.out(sig[1]), .a(in), .b(4'b0001));
    CompareEQ_4bits CEQ2(.out(sig[2]), .a(in), .b(4'b0010));
    CompareEQ_4bits CEQ3(.out(sig[3]), .a(in), .b(4'b0011));
    CompareEQ_4bits CEQ4(.out(sig[4]), .a(in), .b(4'b0100));
    CompareEQ_4bits CEQ5(.out(sig[5]), .a(in), .b(4'b0101));
    CompareEQ_4bits CEQ6(.out(sig[6]), .a(in), .b(4'b0110));
    CompareEQ_4bits CEQ7(.out(sig[7]), .a(in), .b(4'b0111));
    CompareEQ_4bits CEQ8(.out(sig[8]), .a(in), .b(4'b1000));
    CompareEQ_4bits CEQ9(.out(sig[9]), .a(in), .b(4'b1001));
    CompareEQ_4bits CEQA(.out(sig[10]), .a(in), .b(4'b1010));
    CompareEQ_4bits CEQB(.out(sig[11]), .a(in), .b(4'b1011));
    CompareEQ_4bits CEQC(.out(sig[12]), .a(in), .b(4'b1100));
    CompareEQ_4bits CEQD(.out(sig[13]), .a(in), .b(4'b1101));
    CompareEQ_4bits CEQE(.out(sig[14]), .a(in), .b(4'b1110));
    CompareEQ_4bits CEQF(.out(sig[15]), .a(in), .b(4'b1111));
    
    Copy_8bits C0(.out(zero), .in(8'b00000011));
    Copy_8bits C1(.out(one), .in(8'b10011111));
    Copy_8bits C2(.out(two), .in(8'b00100101));
    Copy_8bits C3(.out(three), .in(8'b00001101));
    Copy_8bits C4(.out(four), .in(8'b10011001));
    Copy_8bits C5(.out(five), .in(8'b01001001));
    Copy_8bits C6(.out(six), .in(8'b01000001));
    Copy_8bits C7(.out(seven), .in(8'b00011111));
    Copy_8bits C8(.out(eight), .in(8'b00000001));
    Copy_8bits C9(.out(nine), .in(8'b00001001));
    Copy_8bits CA(.out(a), .in(8'b00010001));
    Copy_8bits CB(.out(b), .in(8'b11000001));
    Copy_8bits CC(.out(c), .in(8'b01100011));
    Copy_8bits CD(.out(d), .in(8'b10000101));
    Copy_8bits CE(.out(e), .in(8'b01100001));
    Copy_8bits CF(.out(f), .in(8'b01110001));

endmodule

module Or_16to1(out, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p);
    input a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
    output out;
    wire [7:0] tmp8;
    wire [3:0] tmp4;
    wire [2:0] tmp2;

    Or T80(.out(tmp8[0]), .a(a), .b(b));
    Or T81(.out(tmp8[1]), .a(c), .b(d));
    Or T82(.out(tmp8[2]), .a(e), .b(f));
    Or T83(.out(tmp8[3]), .a(g), .b(h));
    Or T84(.out(tmp8[4]), .a(i), .b(j));
    Or T85(.out(tmp8[5]), .a(k), .b(l));
    Or T86(.out(tmp8[6]), .a(m), .b(n));
    Or T87(.out(tmp8[7]), .a(o), .b(p));

    Or T40(.out(tmp4[0]), .a(tmp8[0]), .b(tmp8[1]));
    Or T41(.out(tmp4[1]), .a(tmp8[2]), .b(tmp8[3]));
    Or T42(.out(tmp4[2]), .a(tmp8[4]), .b(tmp8[5]));
    Or T43(.out(tmp4[3]), .a(tmp8[6]), .b(tmp8[7]));

    Or T20(.out(tmp2[0]), .a(tmp4[0]), .b(tmp4[1]));
    Or T21(.out(tmp2[1]), .a(tmp4[2]), .b(tmp4[3]));

    Or Out(.out(out), .a(tmp2[0]), .b(tmp2[1]));

endmodule

module Copy_8bits(out, in);
    input [7:0] in;
    output [7:0] out;

    Copy C7(.out(out[7]), .in(in[7]));
    Copy C6(.out(out[6]), .in(in[6]));
    Copy C5(.out(out[5]), .in(in[5]));
    Copy C4(.out(out[4]), .in(in[4]));
    Copy C3(.out(out[3]), .in(in[3]));
    Copy C2(.out(out[2]), .in(in[2]));
    Copy C1(.out(out[1]), .in(in[1]));
    Copy C0(.out(out[0]), .in(in[0]));

endmodule

module Decode_And_Execute(rs, rt, sel, rd);
    input [4-1:0] rs, rt;
    input [3-1:0] sel;
    output [4-1:0] rd;
    wire [7:0] SIG;
    wire [3:0] sub000, add001, or010, and011, rs100, ls101, clt110, ceq111;
    wire [3:0] as_sub, as_add, as_or, as_and, as_rs, as_ls, as_clt, as_ceq;

    CompareEQ_3bits SIG000(.out(SIG[0]), .a(sel), .b(3'b000));
    CompareEQ_3bits SIG001(.out(SIG[1]), .a(sel), .b(3'b001));
    CompareEQ_3bits SIG010(.out(SIG[2]), .a(sel), .b(3'b010));
    CompareEQ_3bits SIG011(.out(SIG[3]), .a(sel), .b(3'b011));
    CompareEQ_3bits SIG100(.out(SIG[4]), .a(sel), .b(3'b100));
    CompareEQ_3bits SIG101(.out(SIG[5]), .a(sel), .b(3'b101));
    CompareEQ_3bits SIG110(.out(SIG[6]), .a(sel), .b(3'b110));
    CompareEQ_3bits SIG111(.out(SIG[7]), .a(sel), .b(3'b111));

    Sub SUB000(.out(sub000), .rs(rs), .rt(rt), .sign());
    Add ADD001(.out(add001), .rs(rs), .rt(rt), .cout());
    BitwiseOr OR010(.out(or010), .rs(rs), .rt(rt));
    BitwiseAnd AND011(.out(and011), .rs(rs), .rt(rt));
    RightShift RS100(.out(rs100), .rt(rt));
    LeftShift LS101(.out(ls101), .rs(rs));
    CompareLT CLT110(.out(clt110), .rs(rs), .rt(rt));
    CompareEQ CEQ111(.out(ceq111), .rs(rs), .rt(rt));

    AndSelect_4bits AsSub(.out(as_sub), .in(sub000), .sel(SIG[0]));
    AndSelect_4bits AsAdd(.out(as_add), .in(add001), .sel(SIG[1]));
    AndSelect_4bits AsOr(.out(as_or), .in(or010), .sel(SIG[2]));
    AndSelect_4bits AsAnd(.out(as_and), .in(and011), .sel(SIG[3]));
    AndSelect_4bits AsRs(.out(as_rs), .in(rs100), .sel(SIG[4]));
    AndSelect_4bits AsLs(.out(as_ls), .in(ls101), .sel(SIG[5]));
    AndSelect_4bits AsClt(.out(as_clt), .in(clt110), .sel(SIG[6]));
    AndSelect_4bits AsCeq(.out(as_ceq), .in(ceq111), .sel(SIG[7]));

    Or_8to1 Out3(
        .out(rd[3]),
        .in0(as_sub[3]),
        .in1(as_add[3]),
        .in2(as_or[3]),
        .in3(as_and[3]),
        .in4(as_rs[3]),
        .in5(as_ls[3]),
        .in6(as_clt[3]),
        .in7(as_ceq[3])
    );
    Or_8to1 Out2(
        .out(rd[2]),
        .in0(as_sub[2]),
        .in1(as_add[2]),
        .in2(as_or[2]),
        .in3(as_and[2]),
        .in4(as_rs[2]),
        .in5(as_ls[2]),
        .in6(as_clt[2]),
        .in7(as_ceq[2])
    );
    Or_8to1 Out1(
        .out(rd[1]),
        .in0(as_sub[1]),
        .in1(as_add[1]),
        .in2(as_or[1]),
        .in3(as_and[1]),
        .in4(as_rs[1]),
        .in5(as_ls[1]),
        .in6(as_clt[1]),
        .in7(as_ceq[1])
    );
    Or_8to1 Out0(
        .out(rd[0]),
        .in0(as_sub[0]),
        .in1(as_add[0]),
        .in2(as_or[0]),
        .in3(as_and[0]),
        .in4(as_rs[0]),
        .in5(as_ls[0]),
        .in6(as_clt[0]),
        .in7(as_ceq[0])
    );

endmodule

module Or_8to1(out, in0, in1, in2, in3, in4, in5, in6, in7);
    input in0, in1, in2, in3, in4, in5, in6, in7;
    output out;
    wire or01, or23, or45, or67, or0123, or4567;

    Or Or01(.out(or01), .a(in0), .b(in1));
    Or Or23(.out(or23), .a(in2), .b(in3));
    Or Or45(.out(or45), .a(in4), .b(in5));
    Or Or67(.out(or67), .a(in6), .b(in7));

    Or Or0123(.out(or0123), .a(or01), .b(or23));
    Or Or4567(.out(or4567), .a(or45), .b(or67));

    Or OrOut(.out(out), .a(or0123), .b(or4567));

endmodule

module AndSelect_4bits(out, in, sel);
    input [3:0] in;
    input sel;
    output [3:0] out;

    And And3(.out(out[3]), .a(in[3]), .b(sel));
    And And2(.out(out[2]), .a(in[2]), .b(sel));
    And And1(.out(out[1]), .a(in[1]), .b(sel));
    And And0(.out(out[0]), .a(in[0]), .b(sel));

endmodule

module AndSelect_8bits(out, in, sel);
    input [7:0] in;
    input sel;
    output [7:0] out;

    And And7(.out(out[7]), .a(in[7]), .b(sel));
    And And6(.out(out[6]), .a(in[6]), .b(sel));
    And And5(.out(out[5]), .a(in[5]), .b(sel));
    And And4(.out(out[4]), .a(in[4]), .b(sel));
    And And3(.out(out[3]), .a(in[3]), .b(sel));
    And And2(.out(out[2]), .a(in[2]), .b(sel));
    And And1(.out(out[1]), .a(in[1]), .b(sel));
    And And0(.out(out[0]), .a(in[0]), .b(sel));

endmodule

module Add(out, rs, rt, cout);
    input [3:0] rs, rt;
    output [3:0] out;
    output cout;
    wire carry01, carry12, carry23;

    Half_Adder Add0(.a(rs[0]), .b(rt[0]), .cout(carry01), .sum(out[0]));
    Full_Adder Add1(.a(rs[1]), .b(rt[1]), .cin(carry01), .cout(carry12), .sum(out[1]));
    Full_Adder Add2(.a(rs[2]), .b(rt[2]), .cin(carry12), .cout(carry23), .sum(out[2]));
    Full_Adder Add3(.a(rs[3]), .b(rt[3]), .cin(carry23), .cout(cout), .sum(out[3]));

endmodule

module Sub(out, rs, rt, sign);
    input [3:0] rs, rt;
    output [3:0] out;
    output sign;
    wire [3:0] invt_rt, neg_rt;
    wire tmp_sign1, tmp_sign2;

    BitwiseInvt InvtB(.out(invt_rt), .in(rt));
    Add NegB(.out(neg_rt), .rs(invt_rt), .rt(4'b0001), .cout(tmp_sign1));

    Add ASubB(.out(out), .rs(rs), .rt(neg_rt), .cout(tmp_sign2));

    Xor Xor(.out(sign), .a(tmp_sign1), .b(tmp_sign2));

endmodule

module BitwiseInvt(out, in);
    input [3:0] in;
    output [3:0] out;

    Not Not3(.out(out[3]), .in(in[3]));
    Not Not2(.out(out[2]), .in(in[2]));
    Not Not1(.out(out[1]), .in(in[1]));
    Not Not0(.out(out[0]), .in(in[0]));

endmodule

module BitwiseOr(out, rs, rt);
    input [3:0] rs, rt;
    output [3:0] out;

    Or Or3(.out(out[3]), .a(rs[3]), .b(rt[3]));
    Or Or2(.out(out[2]), .a(rs[2]), .b(rt[2]));
    Or Or1(.out(out[1]), .a(rs[1]), .b(rt[1]));
    Or Or0(.out(out[0]), .a(rs[0]), .b(rt[0]));

endmodule

module BitwiseAnd(out, rs, rt);
    input [3:0] rs, rt;
    output [3:0] out;

    And And3(.out(out[3]), .a(rs[3]), .b(rt[3]));
    And And2(.out(out[2]), .a(rs[2]), .b(rt[2]));
    And And1(.out(out[1]), .a(rs[1]), .b(rt[1]));
    And And0(.out(out[0]), .a(rs[0]), .b(rt[0]));

endmodule

module RightShift(out, rt);
    input [3:0] rt;
    output [3:0] out;

    Copy Copy3(.out(out[3]), .in(rt[3]));
    Copy Copy2(.out(out[2]), .in(rt[3]));
    Copy Copy1(.out(out[1]), .in(rt[2]));
    Copy Copy0(.out(out[0]), .in(rt[1]));

endmodule

module LeftShift(out, rs);
    input [3:0] rs;
    output [3:0] out;

    Copy Copy3(.out(out[3]), .in(rs[2]));
    Copy Copy2(.out(out[2]), .in(rs[1]));
    Copy Copy1(.out(out[1]), .in(rs[0]));
    Copy Copy0(.out(out[0]), .in(rs[3]));

endmodule

module CompareLT(out, rs, rt);
    input [3:0] rs, rt;
    output [3:0] out;
    wire [3:0] result;

    Copy Copy3(.out(out[3]), .in(1'b1));
    Copy Copy2(.out(out[2]), .in(1'b0));
    Copy Copy1(.out(out[1]), .in(1'b1));
    CLT_4bits C4(.out(out[0]), .S(rs), .L(rt));


endmodule

module CLT_4bits(out, S, L);
    input [3:0] S, L;
    output out;
    wire XnorResult3, XnorResult2, XnorResult1;
    wire [3:0] FinalResult;
    wire tmp20, tmp10, tmp11, tmp00, tmp01, tmp02, or01, or23;

    Xnor Xnor3(.out(XnorResult3), .a(S[3]), .b(L[3]));
    Xnor Xnor2(.out(XnorResult2), .a(S[2]), .b(L[2]));
    Xnor Xnor1(.out(XnorResult1), .a(S[1]), .b(L[1]));

    CLT_1bit C3(.out(FinalResult[3]), .S(S[3]), .L(L[3]));

    CLT_1bit C2(.out(tmp20), .S(S[2]), .L(L[2]));
    And A2(.out(FinalResult[2]), .a(XnorResult3), .b(tmp20));

    CLT_1bit C1(.out(tmp10), .S(S[1]), .L(L[1]));
    And A11(.out(tmp11), .a(XnorResult3), .b(XnorResult2));
    And A1(.out(FinalResult[1]), .a(tmp10), .b(tmp11));

    CLT_1bit C0(.out(tmp00), .S(S[0]), .L(L[0]));
    And A01(.out(tmp01), .a(XnorResult3), .b(XnorResult2));
    And A02(.out(tmp02), .a(XnorResult1), .b(tmp00));
    And A0(.out(FinalResult[0]), .a(tmp01), .b(tmp02));

    Or O01(.out(or01), .a(FinalResult[0]), .b(FinalResult[1]));
    Or O23(.out(or23), .a(FinalResult[2]), .b(FinalResult[3]));
    Or OrOut(.out(out), .a(or01), .b(or23));

endmodule

module CLT_1bit(out, S, L);
    input S, L;
    output out;
    wire tmp;

    Xor Xor(.out(tmp), .a(S), .b(L));
    And And(.out(out), .a(tmp), .b(L));

endmodule

module CompareEQ(out, rs, rt);
    input [3:0] rs, rt;
    output [3:0] out;
    wire [3:0] tmp;
    wire tmp01, tmp23;

    Copy Copy3(.out(out[3]), .in(1'b1));
    Copy Copy2(.out(out[2]), .in(1'b1));
    Copy Copy1(.out(out[1]), .in(1'b1));

    Xnor Xnor3(.out(tmp[3]), .a(rs[3]), .b(rt[3]));
    Xnor Xnor2(.out(tmp[2]), .a(rs[2]), .b(rt[2]));
    Xnor Xnor1(.out(tmp[1]), .a(rs[1]), .b(rt[1]));
    Xnor Xnor0(.out(tmp[0]), .a(rs[0]), .b(rt[0]));

    And And01(.out(tmp01), .a(tmp[0]), .b(tmp[1]));
    And And23(.out(tmp23), .a(tmp[2]), .b(tmp[3]));
    And AndOut(.out(out[0]), .a(tmp01), .b(tmp23));

endmodule

module CompareEQ_3bits(out, a, b);
    input [2:0] a, b;
    output out;
    wire [2:0] tmp;
    wire tmp01;

    Xnor Xnor2(.out(tmp[2]), .a(a[2]), .b(b[2]));
    Xnor Xnor1(.out(tmp[1]), .a(a[1]), .b(b[1]));
    Xnor Xnor0(.out(tmp[0]), .a(a[0]), .b(b[0]));

    And And01(.out(tmp01), .a(tmp[0]), .b(tmp[1]));
    And AndOut(.out(out), .a(tmp01), .b(tmp[2]));

endmodule

module CompareEQ_4bits(out, a, b);
    input [3:0] a, b;
    output out;
    wire [3:0] tmp;
    wire tmp01, tmp23;

    Xnor Xnor3(.out(tmp[3]), .a(a[3]), .b(b[3]));
    Xnor Xnor2(.out(tmp[2]), .a(a[2]), .b(b[2]));
    Xnor Xnor1(.out(tmp[1]), .a(a[1]), .b(b[1]));
    Xnor Xnor0(.out(tmp[0]), .a(a[0]), .b(b[0]));

    And And01(.out(tmp01), .a(tmp[0]), .b(tmp[1]));
    And And23(.out(tmp23), .a(tmp[2]), .b(tmp[3]));
    And AndOut(.out(out), .a(tmp01), .b(tmp23));

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

    Universal_Gate UG(.out(out), .a(1), .b(in));

endmodule

module Copy(out, in);
    input in;
    output out;

    Universal_Gate UG(.out(out), .a(in), .b(0));

endmodule

module And(out, a, b);
    input a, b;
    output out;
    wire not_b;

    Not Not(.out(not_b), .in(b));
    Universal_Gate UG(.out(out), .a(a), .b(not_b));


endmodule

module Nand(out, a, b);
    input a, b;
    output out;
    wire a_and_b;

    And And(.out(a_and_b), .a(a), .b(b));
    Not Not(.out(out), .in(a_and_b));

endmodule

module Or(out, a, b);
    input a, b;
    output out;
    wire not_a, not_b;

    Not Not_a(.out(not_a), .in(a));
    Not Not_b(.out(not_b), .in(b));
    Nand NandOut(.out(out), .a(not_a), .b(not_b));

endmodule

/*module Nor(out, a, b);
    input a, b;
    output out;
    wire a_or_b;

    Or Or(.out(a_or_b), .a(a), .b(b));
    Not Not(.out(out), .in(a_or_b));

endmodule*/

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