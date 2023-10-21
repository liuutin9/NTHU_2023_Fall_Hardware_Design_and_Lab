`timescale 1ns/1ps

module FPGA (clk, rst_n, enable, flip, max, min, out, bit, raw_out);
    input clk, rst_n, enable, flip;
    input [3:0] max, min;
    output [7:0] out;
    output [3:0] bit;

    wire dir, newClock, fastClock;
    output wire [3:0] raw_out;
    wire not_rst_n;

    not(not_rst_n, rst_n);

    Clock_Divider_fast CDF(
        .clk(clk),
        .rst_n(not_rst_n),
        .dclk(fastClock)
    );

    Clock_Divider CD(
        .clk(clk),
        .rst_n(not_rst_n),
        .dclk(newClock)
    );

    Parameterized_Ping_Pong_Counter PPPC(
        .clk(fastClock),
        .rst_n(not_rst_n),
        .enable(enable),
        .flip(flip),
        .max(max),
        .min(min),
        .direction(dir),
        .out(raw_out)
    );

    SS7 Display(
        .in(raw_out),
        .dir(dir),
        .clk(newClock),
        .out(out),
        .bit(bit),
        .rst_n(not_rst_n)
    );

endmodule

module SS7 (in, dir, clk, out, bit, rst_n);
    input [3:0] in;
    input dir, clk, rst_n;
    output reg [7:0] out;
    output reg [3:0] bit;

    reg [7:0] out_3, out_2, out_1, out_0;
    reg [1:0] count, rst_count;

    always @ (rst_n or count) begin
        case (rst_n)
            1'b0: rst_count = 2'b00;
            1'b1: rst_count = count + 2'b01;
        endcase
    end

    always @ (posedge clk) begin
        count <= rst_count;
    end

    always @ (count) begin
        case (count)
            2'b00: bit = 4'b0111;
            2'b01: bit = 4'b1011;
            2'b10: bit = 4'b1101;
            2'b11: bit = 4'b1110;
        endcase
    end

    always @ (count or out_3 or out_2 or out_1 or out_0) begin
        case (count)
            2'b00: out = out_3;
            2'b01: out = out_2;
            2'b10: out = out_1;
            2'b11: out = out_0;
        endcase
    end

    // 3rd bit
    always @ (in) begin
        case (in)
            4'b0000: out_3 = 8'b00000011;
            4'b0001: out_3 = 8'b00000011;
            4'b0010: out_3 = 8'b00000011;
            4'b0011: out_3 = 8'b00000011;
            4'b0100: out_3 = 8'b00000011;
            4'b0101: out_3 = 8'b00000011;
            4'b0110: out_3 = 8'b00000011;
            4'b0111: out_3 = 8'b00000011;
            4'b1000: out_3 = 8'b00000011;
            4'b1001: out_3 = 8'b00000011;
            4'b1010: out_3 = 8'b10011111;
            4'b1011: out_3 = 8'b10011111;
            4'b1100: out_3 = 8'b10011111;
            4'b1101: out_3 = 8'b10011111;
            4'b1110: out_3 = 8'b10011111;
            4'b1111: out_3 = 8'b10011111;
        endcase
    end

    // 2nd bit
    always @ (in) begin
        case (in)
            4'd0: out_2 = 8'b00000011;
            4'd1: out_2 = 8'b10011111;
            4'd2: out_2 = 8'b00100101;
            4'd3: out_2 = 8'b00001101;
            4'd4: out_2 = 8'b10011001;
            4'd5: out_2 = 8'b01001001;
            4'd6: out_2 = 8'b01000001;
            4'd7: out_2 = 8'b00011111;
            4'd8: out_2 = 8'b00000001;
            4'd9: out_2 = 8'b00001001;
            4'd10: out_2 = 8'b00000011;
            4'd11: out_2 = 8'b10011111;
            4'd12: out_2 = 8'b00100101;
            4'd13: out_2 = 8'b00001101;
            4'd14: out_2 = 8'b10011001;
            4'd15: out_2 = 8'b01001001;
        endcase
    end

    // 1st bit
    always @ (dir) begin
        case (dir)
            1'b0: out_1 = 8'b11000111;
            1'b1: out_1 = 8'b00111011;
        endcase
    end

    // 0th bit
    always @ (*) begin
        case (dir)
            1'b0: out_0 = 8'b11000111;
            1'b1: out_0 = 8'b00111011;
        endcase
    end

endmodule

module Parameterized_Ping_Pong_Counter (clk, rst_n, enable, flip, max, min, direction, out);
    input clk, rst_n;
    input enable;
    input flip;
    input [4-1:0] max;
    input [4-1:0] min;
    output reg direction;
    output reg [4-1:0] out;

    reg [3:0] dir_to_enable, enable_to_rst_n, rst_n_to_DFF;
    reg dir_from_xor, dir_from_rst_mux, dir_from_enable, dir_from_or, dir_from_or2;
    reg newEnable;

    // newEnable
    always @ (enable or min or max or out) begin
        newEnable = enable & (min < max) & !(out < min) & !(out > max);
    end

    // OR
    always @ (direction or out or min or max) begin
        dir_from_or = (direction == 1'b1 && out == max) || (direction == 1'b0 && out == min);
    end

    // OR2
    always @ (dir_from_or or max or min or flip or out) begin
        dir_from_or2 = dir_from_or | ((out > min) & (out < max) & flip);
    end

    // XOR
    always @ (direction or dir_from_or2) begin
        dir_from_xor = (dir_from_or2 ^ direction);
    end

    // Mux: direction selected by newEnable
    always @ (dir_from_xor or newEnable or direction) begin
        case (newEnable)
            1'b0: dir_from_enable = direction;
            1'b1: dir_from_enable = dir_from_xor;
        endcase
    end

    // Mux: direction selected by rst_n
    always @ (dir_from_enable or rst_n) begin
        case (rst_n)
            1'b0: dir_from_rst_mux = 1'b1;
            1'b1: dir_from_rst_mux = dir_from_enable;
        endcase
    end

    // DFF: direction
    always @ (posedge clk) begin
        direction <= dir_from_rst_mux;
    end

    // Mux: out selected by direction
    always @ (direction or out or min or max) begin
        case (direction)
            1'b0: dir_to_enable = (out != min) ? out - 4'd1 : out + 4'd1;
            1'b1: dir_to_enable = (out != max) ? out + 4'd1 : out - 4'd1;
        endcase
    end

    // Mux: out selected by newEnable
    always @ (dir_to_enable or out or newEnable) begin
        case (newEnable)
            1'b0: enable_to_rst_n = out;
            1'b1: enable_to_rst_n = dir_to_enable;
        endcase
    end

    // Mux: out selected by rst_n
    always @ (rst_n or enable_to_rst_n) begin
        case (rst_n)
            1'b0: rst_n_to_DFF = min;
            1'b1: rst_n_to_DFF = enable_to_rst_n;
        endcase
    end

    // DFF: out
    always @ (posedge clk) begin
        out <= rst_n_to_DFF;
    end

endmodule

module Clock_Divider (clk, rst_n, dclk);
    input clk, rst_n;
    output dclk;

    reg dclk;
    reg [16:0] count, tmp_count;

    always @ (count or rst_n) begin
        case (rst_n)
            1'b0: tmp_count = 17'd0;
            1'b1: tmp_count = count + 17'd1;
        endcase
    end

    always @ (count) begin
        case (count)
            17'd0: dclk = 1'b1;
            default: dclk = 1'b0;
        endcase
    end

    always @ (posedge clk) begin
        count <= tmp_count;
    end

endmodule

module Clock_Divider_fast (clk, rst_n, dclk);
    input clk, rst_n;
    output dclk;

    reg dclk;
    reg [26:0] count, tmp_count;

    always @ (count or rst_n) begin
        case (rst_n)
            1'b0: tmp_count = 27'd0;
            1'b1: tmp_count = count + 27'd1;
        endcase
    end

    always @ (count) begin
        case (count)
            27'd0: dclk = 1'b1;
            default: dclk = 1'b0;
        endcase
    end

    always @ (posedge clk) begin
        count <= tmp_count;
    end

endmodule
