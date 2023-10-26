`timescale 1ns / 1ps

module Lab4_Basic_2(in, clk, rst_n, out, state);
    input in, clk, rst_n;
    output reg out;
    output reg [2:0] state;
    reg tmp_out;
    reg [2:0] tmp_state;

    always @ (posedge clk) begin
        state <= tmp_state;
        out <= tmp_out;
    end

    always @ (*) begin
        if (!rst_n) begin
            tmp_state = 3'd0;
            tmp_out = 1'b0;
        end
        else begin
            case (state)
                3'd0: begin
                    case (in)
                        1'b0: begin
                            tmp_state = 3'd0;
                            tmp_out = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = 3'd2;
                            tmp_out = 1'b1;
                        end
                    endcase
                end
                3'd1: begin
                    case (in)
                        1'b0: begin
                            tmp_state = 3'd0;
                            tmp_out = 1'b1;
                        end
                        1'b1: begin
                            tmp_state = 3'd4;
                            tmp_out = 1'b1;
                        end
                    endcase
                end
                3'd2: begin
                    case (in)
                        1'b0: begin
                            tmp_state = 3'd5;
                            tmp_out = 1'b1;
                        end
                        1'b1: begin
                            tmp_state = 3'd1;
                            tmp_out = 1'b0;
                        end
                    endcase
                end
                3'd3: begin
                    case (in)
                        1'b0: begin
                            tmp_state = 3'd3;
                            tmp_out = 1'b1;
                        end
                        1'b1: begin
                            tmp_state = 3'd2;
                            tmp_out = 1'b0;
                        end
                    endcase
                end
                3'd4: begin
                    case (in)
                        1'b0: begin
                            tmp_state = 3'd2;
                            tmp_out = 1'b1;
                        end
                        1'b1: begin
                            tmp_state = 3'd4;
                            tmp_out = 1'b1;
                        end
                    endcase
                end
                3'd5: begin
                    case (in)
                        1'b0: begin
                            tmp_state = 3'd3;
                            tmp_out = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = 3'd4;
                            tmp_out = 1'b0;
                        end
                    endcase
                end
                default: begin
                    tmp_state = state;
                    tmp_out = out;
                end
            endcase
        end
    end

endmodule
