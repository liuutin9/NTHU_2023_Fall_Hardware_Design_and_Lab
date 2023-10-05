`timescale 1ns / 1ps

module Lab2_111060013_Decode_And_Execute_t;
    reg [3:0] rs, rt;
    reg [2:0] sel;
    wire [3:0] rd;

    Decode_And_Execute DAE(
        .rs(rs),
        .rt(rt),
        .sel(sel),
        .rd(rd)
    );

    initial begin
        rs <= 4'b0000; // 0
        rt <= 4'b0001; // 1
        sel <= 3'b000;

        repeat (7) #1 sel = sel + 1;

        #1 rs <= 4'b1000; // 8
           rt <= 4'b0001; // 1
           sel <= 3'b000;

        repeat (7) #1 sel = sel + 1;

        #1 rs <= 4'b1000; // 8
           rt <= 4'b1001; // 9
           sel <= 3'b000;

        repeat (7) #1 sel = sel + 1;

        #1 rs <= 4'b1000; // 8
           rt <= 4'b1000; // 8
           sel <= 3'b000;

        repeat (7) #1 sel = sel + 1;

        #1 $finish;

    end

endmodule