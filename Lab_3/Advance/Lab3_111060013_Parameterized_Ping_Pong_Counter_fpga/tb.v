/*`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/21 19:05:21
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb;
    reg clk = 1'b0;
    reg rst_n = 1'b1;
    reg enable = 1'b1;
    reg flip = 2'b0;
    reg [3:0] max = 4'b1111;
    reg [3:0] min = 4'b0000;
    wire [7:0] out;
    wire [3:0] bit;
    wire [3:0] raw_out;

    always # (10) clk = ~clk;

    FPGA Board(clk, rst_n, enable, flip, max, min, out, bit, raw_out);

    initial begin
        #20 rst_n <= 1'b0;
        repeat (60 * (2 ** 27)) #1 ;
        #400 $finish;
    end

endmodule
*/