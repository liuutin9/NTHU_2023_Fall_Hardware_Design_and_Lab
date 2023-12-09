`timescale 1ns/1ps
module tracker_sensor(clk, reset, left_signal, right_signal, mid_signal, state);
    input clk;
    input reset;
    input left_signal, right_signal, mid_signal;
    output reg [2:0] state;

    parameter STOP = 3'd0;
    parameter FOWARD = 3'd1;
    parameter BACK = 3'd2;
    parameter LEFT = 3'd3;
    parameter RIGHT = 3'd4;

    // [TO-DO] Receive three signals and make your own policy.
    // Hint: You can use output state to change your action.

    always @ (*) begin
        case ({left_signal, mid_signal, right_signal})
            3'b000: begin
                state = BACK;
            end
            3'b001: begin
                state = RIGHT;
            end
            3'b011: begin
                state = RIGHT;
            end
            3'b010: begin
                state = FOWARD;
            end
            3'b111: begin
                state = FOWARD;
            end
            3'b110: begin
                state = LEFT;
            end
            3'b100: begin
                state = LEFT;
            end
            default: begin
                state = STOP;
            end
        endcase
    end

endmodule
