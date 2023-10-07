`timescale 1ns / 1ps

module Lab2_111060013_Ripple_Carry_Adder_t;
    reg [7:0] a = 8'b00001010;
    reg [7:0] b = 8'b00001011;
    reg cin = 1'b0;
    wire [7:0] sum;
    wire cout;
    reg tmpc;
    reg [7:0] tmps;
    reg err;

    Ripple_Carry_Adder RCA(
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    always @(*) begin
        {tmpc, tmps} = a + b + cin;
        if (tmpc == cout && tmps == sum) err = 1'b0;
        else err = 1'b1; 
    end

    initial begin
        repeat (2 ** 8) begin
            #1
            a <= a + 1;
            b <= b + 1;
            cin <= ~cin;
        end
        #1 $finish;
    end
endmodule