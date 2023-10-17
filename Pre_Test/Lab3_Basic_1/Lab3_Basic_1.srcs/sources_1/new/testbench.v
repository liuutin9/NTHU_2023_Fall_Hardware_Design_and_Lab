`timescale 1ns / 1ps

module testbench;
    reg clk = 1'b0;
    reg rst_n = 1'b0;
    reg finish = 1'b0;
    reg start = 1'b0;
    reg [1:0] sel = 2'b11;
    wire dclk;

    Clock_Divider CD (
        .clk(clk),
        .rst_n(rst_n),
        .sel(sel),
        .dclk(dclk)
    ); 

    initial begin
        repeat (97) begin
            #1 clk = ~clk;
        end
        #1 $finish;
    end

    always @ (negedge clk) begin
        if (start) rst_n <= 1;
        else rst_n <= 0;
    end
    
    always @ (posedge clk) begin
        start <= 1'b1;
    end

endmodule
