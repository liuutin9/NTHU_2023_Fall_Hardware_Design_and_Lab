`timescale 1ns / 1ps

module Memory_Array_128x8(clk, ren, wen, addr, din, dout);
    input clk, ren, wen;
    input [6:0] addr;
    input [7:0] din;
    output reg [7:0] dout;
    reg [7:0] memory [6:0];

    always @(posedge clk) begin
        if (ren == 1'b1) begin
            memory[addr] <= din;
            dout <= dout;
        end
        else if (wen == 1'b1) begin
            memory[addr] <= memory[addr];
            dout <= memory[addr];
        end
        else begin
            memory[addr] <= memory[addr];
            dout <= dout;
        end
    end

endmodule
