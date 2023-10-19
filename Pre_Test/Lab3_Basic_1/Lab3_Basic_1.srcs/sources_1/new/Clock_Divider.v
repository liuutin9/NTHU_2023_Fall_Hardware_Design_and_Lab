`timescale 1ns / 1ps

module Clock_Divider(clk, rst_n, dclk, sel);
    input clk, rst_n;
    input [1:0] sel;
    output reg dclk;
    reg clk1_3, clk1_2, clk1_4, clk1_8;
    reg [4:0] count2, count3, count4, count8;

    always @ (posedge clk) begin
        if (rst_n == 1'b0) begin
            clk1_3 <= 1'b1;
            clk1_2 <= 1'b1;
            clk1_4 <= 1'b1;
            clk1_8 <= 1'b1;
            count3 <= 4'd1;
            count2 <= 4'd1;
            count4 <= 4'd1;
            count8 <= 4'd1;
        end
        else begin
            if (count3 == 4'd0) begin
                clk1_3 <= 1'b1;
                count3 <= count3 + 4'd1;
            end
            else  if (count3 == 4'd1) begin
                clk1_3 <= 1'b0;
                count3 <= count3 + 4'b1;
            end
            else count3 <= 4'd0;

            if (count2 == 4'd0) begin
                clk1_2 <= 1'b1;
                count2 <= count2 + 4'd1;
            end
            else begin
                clk1_2 <= 1'b0;
                count2 <= 4'd0;
            end

            if (count4 == 4'd0) begin
                clk1_4 <= 1'b1;
                count4 <= count4 + 1;
            end
            else if (count4 == 4'd1) begin
                clk1_4 <= 1'b0;
                count4 <= count4 + 4'd1;
            end
            else if (count4 == 4'd2) count4 <= count4 + 4'd1;
            else count4 <= 4'd0;
            
            if (count8 == 4'd0) begin
                clk1_8 <= 1'b1;
                count8 <= count8 + 1;
            end
            else if (count8 == 4'd1) begin
                clk1_8 <= 1'b0;
                count8 <= count8 + 4'd1;
            end
            else if (count8 == 4'd7) count8 <= 4'd0;
            else count8 <= count8 + 4'd1;
        end
    end

    always @ (clk1_3 or clk1_2 or clk1_4 or clk1_8 or sel) begin
        if (sel == 2'b00) dclk = clk1_3;
        else if (sel == 2'b01) dclk = clk1_2;
        else if (sel == 2'b10) dclk = clk1_4;
        else dclk = clk1_8;
    end

endmodule