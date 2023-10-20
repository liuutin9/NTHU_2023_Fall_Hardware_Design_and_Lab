`timescale 1ns/1ps



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
    always @ (dir_from_xor or newEnable) begin
        case (newEnable)
            1'b0: dir_from_enable = direction;
            1'b1: dir_from_enable = dir_from_xor;
        endcase
    end

    // Mux: direction selected by rst_n
    always @ (dir_from_enable or rst_n) begin
        case (rst_n)
            1'b0: dir_from_rst_mux = 1'b1;
            1'b1: dir_from_rst_mux = dir_from_xor;
        endcase
    end

    // DFF: direction
    always @ (posedge clk) begin
        direction <= dir_from_rst_mux;
    end

    // Mux: out selected by direction
    always @ (direction or out or min or max) begin
        case (direction)
            1'b0: dir_to_enable = (out != min) ? out - 1 : out + 1;
            1'b1: dir_to_enable = (out != max) ? out + 1 : out - 1;
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