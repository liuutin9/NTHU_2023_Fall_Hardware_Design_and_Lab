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
    parameter STRONG_LEFT = 3'd5;
    parameter STRONG_RIGHT = 3'd6;

    reg [2:0] next_state;
    reg [22:0] counter;
    // reg [2:0] strong_state, next_strong_state;
    // [TO-DO] Receive three signals and make your own policy.
    // Hint: You can use output state to change your action.
/*
    always @ (posedge clk) begin
        if (reset==1'd1) counter <= 23'd0;
        else counter <= counter + 23'd1;
    end
*/
    always @ (posedge clk) begin
        if (reset==1'd1) begin
            state <= STOP;
            // strong_state <= 3'd0;
        end
        else begin
            state <= next_state;
            // strong_state <= next_strong_state;
        end
    end
    always @ (*) begin
        //if (counter == 23'd0) begin
            case ({left_signal, mid_signal, right_signal})
                3'b000: begin
                    if (state == STRONG_LEFT || state == STRONG_RIGHT) next_state = /*strong_state*/state;
                    else if (state == LEFT) next_state = STRONG_LEFT;
                    else if (state == RIGHT) next_state = STRONG_RIGHT;
                    else next_state = BACK;
                    // next_strong_state = strong_state;
                end
                3'b001: begin
                    next_state = STRONG_RIGHT;
                    // next_strong_state = STRONG_RIGHT;
                end
                3'b011: begin
                    next_state = RIGHT;
                    // next_strong_state = strong_state;
                end
                3'b010: begin
                    next_state = FOWARD;
                    // next_strong_state = strong_state;
                end
                3'b111: begin
                    next_state = FOWARD;
                    // next_strong_state = strong_state;
                end
                3'b110: begin
                    next_state = LEFT;
                    // next_strong_state = strong_state;
                end
                3'b100: begin
                    next_state = STRONG_LEFT;
                    // next_strong_state = STRONG_LEFT;
                end
                default: begin
                    next_state = BACK;
                    // next_strong_state = strong_state;
                end
            endcase/*
        end
        else begin
            state <= state;
        end
        */
    end

endmodule
