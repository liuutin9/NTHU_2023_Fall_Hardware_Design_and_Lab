`timescale 1ns / 1ps

module Lab4_Basic_1(in, out, clk, rst_n, state);
    input in, clk, rst_n;
    output reg [1:0] out;
    output reg [2:0] state;
    reg [1:0] tmp_out;
    reg [2:0] tmp_state;

    always @ (posedge clk) begin
        state <= tmp_state;
        out <= tmp_out;
    end

    always @ (*) begin
        if (!rst_n) begin
            tmp_state = 3'd0;
            tmp_out = 2'b11;
        end
        else begin
            case (state)
                3'd0: begin
                    if (in) begin
                        tmp_state = 3'd2;
                        tmp_out = 2'b11;
                    end
                    else begin
                        tmp_state = 3'd1;
                        tmp_out = 2'b01;
                    end
                end
                3'd1: begin
                    if (in) begin
                        tmp_state = 3'd5;
                        tmp_out = 2'b00;
                    end
                    else begin
                        tmp_state = 3'd4;
                        tmp_out = 2'b10;
                    end
                end
                3'd2: begin
                    if (in) begin
                        tmp_state = 3'd3;
                        tmp_out = 2'b10;
                    end
                    else begin
                        tmp_state = 3'd1;
                        tmp_out = 2'b01;
                    end
                end
                3'd3: begin
                    if (in) begin
                        tmp_state = 3'd0;
                        tmp_out = 2'b11;
                    end
                    else begin
                        tmp_state = 3'd1;
                        tmp_out = 2'b01;
                    end
                end
                3'd4: begin
                    if (in) begin
                        tmp_state = 3'd5;
                        tmp_out = 2'b00;
                    end
                    else begin
                        tmp_state = 3'd4;
                        tmp_out = 2'b10;
                    end
                end
                3'd5: begin
                    if (in) begin
                        tmp_state = 3'd0;
                        tmp_out = 2'b11;
                    end
                    else begin
                        tmp_state = 3'd3;
                        tmp_out = 2'b10;
                    end
                end
                default: begin
                    tmp_state = state;
                    tmp_out = out;
                end
            endcase
        end
    end

endmodule
