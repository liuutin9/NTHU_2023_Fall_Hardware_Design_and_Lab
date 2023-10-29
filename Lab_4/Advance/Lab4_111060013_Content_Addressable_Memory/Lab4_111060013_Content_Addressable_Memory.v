`timescale 1ns/1ps

module Content_Addressable_Memory(clk, wen, ren, din, addr, dout, hit);
    input clk;
    input wen, ren;
    input [7:0] din;
    input [3:0] addr;
    output reg [3:0] dout;
    output reg hit;
    reg [7:0] mem [3:0];
    reg [3:0] isHit;

    always @ (*) begin
        isHit[0] = mem[0] == din;
        isHit[1] = mem[1] == din;
        isHit[2] = mem[2] == din;
        isHit[3] = mem[3] == din;

        isHit[4] = mem[4] == din;
        isHit[5] = mem[5] == din;
        isHit[6] = mem[6] == din;
        isHit[7] = mem[7] == din;

        isHit[8] = mem[8] == din;
        isHit[9] = mem[9] == din;
        isHit[10] = mem[10] == din;
        isHit[11] = mem[11] == din;

        isHit[12] = mem[12] == din;
        isHit[13] = mem[13] == din;
        isHit[14] = mem[14] == din;
        isHit[15] = mem[15] == din;
    end

endmodule
