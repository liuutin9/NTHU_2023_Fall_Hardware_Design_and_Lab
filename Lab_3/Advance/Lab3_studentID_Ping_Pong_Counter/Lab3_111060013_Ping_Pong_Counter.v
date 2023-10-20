`timescale 1ns/1ps

module Ping_Pong_Counter (clk, rst_n, enable, direction, out);
    input clk, rst_n;
    input enable;
    output reg direction;
    output reg [4-1:0] out;

    reg [3:0] dir_to_enable, enable_to_rst_n, rst_n_to_DFF, dir_from_xor, dir_from_rst_mux, dir_from_enable, dir_from_or;

    always @ (direction or out) begin
        dir_from_or = (direction == 1'b1 & out == 4'b1111) | (direction == 1'b0 & out == 4'b0000);
    end

    always @ (direction or dir_from_or) begin
        dir_from_xor = dir_from_or ^ direction;
    end

    always @ (dir_from_xor or enable) begin
        case (enable)
            1'b0: dir_from_enable = direction;
            1'b1: dir_from_enable = dir_from_xor;
        endcase
    end

    always @ (dir_from_enable or rst_n) begin
        case (rst_n)
            1'b0: dir_from_rst_mux = 1'b1;
            1'b1: dir_from_rst_mux = dir_from_xor;
        endcase
    end

    always @ (posedge clk) begin
        direction <= dir_from_rst_mux;
    end

    // Mux: selected by direction
    always @ (direction or out) begin
        case (direction)
            1'b0: dir_to_enable = (out == 4'b0000) ? out + 1 : out - 1;
            1'b1: dir_to_enable = (out == 4'b1111) ? out - 1 : out + 1;
        endcase
    end

    // Mux: selected by enable
    always @ (dir_to_enable or out or enable) begin
        case (enable)
            1'b0: enable_to_rst_n = out;
            1'b1: enable_to_rst_n = dir_to_enable;
        endcase
    end

    // Mux: selected by rst_n
    always @ (rst_n or enable_to_rst_n) begin
        case (rst_n)
            1'b0: rst_n_to_DFF = 4'b0000;
            1'b1: rst_n_to_DFF = enable_to_rst_n;
        endcase
    end

    // DFF
    always @ (posedge clk) begin
        out <= rst_n_to_DFF;
    end

endmodule
