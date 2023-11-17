`timescale 1ns/1ps

module Sliding_Window_Sequence_Detector (clk, rst_n, in, dec);
    input clk, rst_n;
    input in;
    output reg dec;
    reg [3:0] state, tmp_state;

    parameter Start = 4'd0;
    parameter one_1 = 4'd1;
    parameter two_11 = 4'd2;
    parameter three_111 = 4'd3;
    parameter four_1110 = 4'd4;
    // let head = 1110
    parameter head_0 = 4'd5;
    parameter head_01 = 4'd6;
    // let body = several 01
    parameter head_body_1 = 4'd7;
    parameter head_body_11 = 4'd8;

    always @ (posedge clk) begin
        state <= tmp_state;
    end

    always @ (*) begin
        if (!rst_n) begin
            tmp_state = Start;
            dec = 1'b0;
        end
        else begin
            case (state)

                Start: begin
                    case (in)
                        1'b0: begin
                            tmp_state = Start;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = one_1;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                one_1: begin
                    case (in)
                        1'b0: begin
                            tmp_state = Start;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = two_11;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                two_11: begin
                    case (in)
                        1'b0: begin
                            tmp_state = Start;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = three_111;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                three_111: begin
                    case (in)
                        1'b0: begin
                            tmp_state = four_1110;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = three_111;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                four_1110: begin
                    case (in)
                        1'b0: begin
                            tmp_state = head_0;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = one_1;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                head_0: begin
                    case (in)
                        1'b0: begin
                            tmp_state = Start;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = head_01;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                head_01: begin
                    case (in)
                        1'b0: begin
                            tmp_state = head_0;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = head_body_1;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                head_body_1: begin
                    case (in)
                        1'b0: begin
                            tmp_state = Start;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = head_body_11;
                            dec = 1'b1;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                head_body_11: begin
                    case (in)
                        1'b0: begin
                            tmp_state = four_1110;
                            dec = 1'b0;
                        end
                        1'b1: begin
                            tmp_state = three_111;
                            dec = 1'b0;
                        end
                        default: begin
                            tmp_state = state;
                            dec = 1'b0;
                        end
                    endcase
                end

                default: begin
                    tmp_state = state;
                    dec = 1'b0;
                end

            endcase
        end
    end


endmodule 