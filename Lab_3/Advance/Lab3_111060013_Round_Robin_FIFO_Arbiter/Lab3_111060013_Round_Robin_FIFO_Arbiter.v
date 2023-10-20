`timescale 1ns/1ps

module Round_Robin_FIFO_Arbiter(clk, rst_n, wen, a, b, c, d, dout, valid);
    input clk;
    input rst_n;
    input [4-1:0] wen;
    input [8-1:0] a, b, c, d;
    output reg [8-1:0] dout;
    output reg valid;

    wire [7:0] QA_Mux, QB_Mux, QC_Mux, QD_Mux;
    wire [3:0] err;
    reg [3:0] ren, rst_ren;
    reg tmp_valid, rst_valid;
    reg[7:0] tmp_dout, rst_dout, valid_dout;

    // dout
    always @ (ren or QA_Mux or QB_Mux or QC_Mux or QD_Mux) begin
        case (ren)
            4'b0001: tmp_dout = QA_Mux;
            4'b0010: tmp_dout = QB_Mux;
            4'b0100: tmp_dout = QC_Mux;
            4'b1000: tmp_dout = QD_Mux;
            default: tmp_dout = dout;
        endcase
    end

    always @ (tmp_dout or rst_n) begin
        case (rst_n)
            1'b0: rst_dout = 8'b00000000;
            1'b1: rst_dout = tmp_dout;
        endcase
    end

    always @ (posedge clk) begin
        valid_dout <= rst_dout;
    end

    always @ (valid_dout or valid) begin
        case (valid)
            1'b0: dout = 8'b00000000;
            1'b1: dout = valid_dout;
        endcase
    end

    // valid
    always @ (ren or wen or err) begin
        tmp_valid = (err == 4'b0000) && ((ren & wen) == 4'b0000);
    end

    always @ (tmp_valid or rst_n) begin
        case (rst_n)
            1'b0: rst_valid = 1'b0;
            1'b1: rst_valid = tmp_valid;
        endcase
    end

    always @ (posedge clk) begin
        valid <= rst_valid;
    end

    // count ren
    always @ (rst_n or ren) begin
        case (rst_n)
            1'b0: rst_ren = 4'b0001;
            1'b1: rst_ren = {ren[2:0], ren[3]};
        endcase
    end

    always @ (posedge clk) begin
        ren <= rst_ren;
    end

    FIFO_8 QueueA(
        .clk(clk),
        .rst_n(rst_n),
        .wen(wen[0]),
        .ren(ren[0]),
        .din(a),
        .dout(QA_Mux),
        .error(err[0])
    );

    FIFO_8 QueueB(
        .clk(clk),
        .rst_n(rst_n),
        .wen(wen[1]),
        .ren(ren[1]),
        .din(b),
        .dout(QB_Mux),
        .error(err[1])
    );

    FIFO_8 QueueC(
        .clk(clk),
        .rst_n(rst_n),
        .wen(wen[2]),
        .ren(ren[2]),
        .din(c),
        .dout(QC_Mux),
        .error(err[2])
    );

    FIFO_8 QueueD(
        .clk(clk),
        .rst_n(rst_n),
        .wen(wen[3]),
        .ren(ren[3]),
        .din(d),
        .dout(QD_Mux),
        .error(err[3])
    );

endmodule

module FIFO_8(clk, rst_n, wen, ren, din, dout, error);
    input clk;
    input rst_n;
    input wen, ren;
    input [8-1:0] din;
    output reg [8-1:0] dout;
    output reg error;

    reg [3:0] rp, rp_to_rst_n, rst_n_to_rp_DFF;
    reg [3:0] wp, wp_to_rst_n, rst_n_to_wp_DFF;
    reg [7:0] queue [7:0];
    reg [7:0] Mux7, Mux6, Mux5, Mux4, Mux3, Mux2, Mux1, Mux0;
    reg [7:0] DFF [7:0];
    reg [7:0] Rst7, Rst6, Rst5, Rst4, Rst3, Rst2, Rst1, Rst0;
    reg [7:0] tmp_dout, tmp_din;

    // read pointer
    always @ (rp or ren or wen) begin
        case ({wen, ren})
            2'b00: rp_to_rst_n = rp;
            2'b01: rp_to_rst_n = (rp == 4'b1000) ? 4'b1000 : rp + 4'b0001;
            2'b10: rp_to_rst_n = (rp == 4'b0000) ? 4'b0000 : rp - 4'b0001;
            2'b11: rp_to_rst_n = (rp == 4'b0000) ? 4'b0000 : rp - 4'b0001;
        endcase
    end

    always @ (rp_to_rst_n or rst_n) begin
        case (rst_n)
            1'b0: rst_n_to_rp_DFF = 4'b1000;
            1'b1: rst_n_to_rp_DFF = rp_to_rst_n;
        endcase
    end

    always @ (posedge clk) begin
        rp <= rst_n_to_rp_DFF;
    end

    // write pointer
    always @ (wp or ren or wen) begin
        case ({wen, ren})
            2'b00: wp_to_rst_n = wp;
            2'b01: wp_to_rst_n = (wp == 4'b0111) ? 4'b0111 : wp + 4'b0001;
            2'b10: wp_to_rst_n = (wp == 4'b1111) ? 4'b1111 : wp - 4'b0001;
            2'b11: wp_to_rst_n = (wp == 4'b1111) ? 4'b1111 : wp - 4'b0001;
        endcase
    end

    always @ (wp_to_rst_n or rst_n) begin
        case (rst_n)
            1'b0: rst_n_to_wp_DFF = 4'b0111;
            1'b1: rst_n_to_wp_DFF = wp_to_rst_n;
        endcase
    end

    always @ (posedge clk) begin
        wp <= rst_n_to_wp_DFF;
    end

    // 7th bit
    always @ (wp or wen or Mux7 or din or DFF[7]) begin
        case ({wen, wp != 4'b1111})
            default: Mux7 = DFF[7];
            2'b11: Mux7 = din;
        endcase
    end

    always @ (rst_n or Mux7) begin
        case (rst_n)
            1'b0: Rst7 = 8'b00000000;
            1'b1: Rst7 = Mux7;
        endcase
    end

    always @ (posedge clk) begin
        DFF[7] <= Rst7;
    end

    // 6th bit
    always @ (wp or wen or Mux6 or DFF[7] or DFF[6]) begin
        case ({wen, wp != 4'b1111})
            default: Mux6 = DFF[6];
            2'b11: Mux6 = DFF[7];
        endcase
    end

    always @ (rst_n or Mux6) begin
        case (rst_n)
            1'b0: Rst6 = 8'b00000000;
            1'b1: Rst6 = Mux6;
        endcase
    end

    always @ (posedge clk) begin
        DFF[6] <= Rst6;
    end

    // 5th bit
    always @ (wp or wen or Mux5 or DFF[6] or DFF[5]) begin
        case ({wen, wp != 4'b1111})
            default: Mux5 = DFF[5];
            2'b11: Mux5 = DFF[6];
        endcase
    end

    always @ (rst_n or Mux5) begin
        case (rst_n)
            1'b0: Rst5 = 8'b00000000;
            1'b1: Rst5 = Mux5;
        endcase
    end

    always @ (posedge clk) begin
        DFF[5] <= Rst5;
    end

    // 4th bit
    always @ (wp or wen or Mux4 or DFF[5] or DFF[4]) begin
        case ({wen, wp != 4'b1111})
            default: Mux4 = DFF[4];
            2'b11: Mux4 = DFF[5];
        endcase
    end

    always @ (rst_n or Mux4) begin
        case (rst_n)
            1'b0: Rst4 = 8'b00000000;
            1'b1: Rst4 = Mux4;
        endcase
    end

    always @ (posedge clk) begin
        DFF[4] <= Rst4;
    end

    // 3rd bit
    always @ (wp or wen or Mux3 or DFF[4] or DFF[3]) begin
        case ({wen, wp != 4'b1111})
            default: Mux3 = DFF[3];
            2'b11: Mux3 = DFF[4];
        endcase
    end

    always @ (rst_n or Mux3) begin
        case (rst_n)
            1'b0: Rst3 = 8'b00000000;
            1'b1: Rst3 = Mux3;
        endcase
    end

    always @ (posedge clk) begin
        DFF[3] <= Rst3;
    end

    // 2nd bit
    always @ (wp or wen or Mux2 or DFF[3] or DFF[2]) begin
        case ({wen, wp != 4'b1111})
            default: Mux2 = DFF[2];
            2'b11: Mux2 = DFF[3];
        endcase
    end

    always @ (rst_n or Mux2) begin
        case (rst_n)
            1'b0: Rst2 = 8'b00000000;
            1'b1: Rst2 = Mux2;
        endcase
    end

    always @ (posedge clk) begin
        DFF[2] <= Rst2;
    end

    // 1st bit
    always @ (wp or wen or Mux1 or DFF[2] or DFF[1]) begin
        case ({wen, wp != 4'b1111})
            default: Mux1 = DFF[1];
            2'b11: Mux1 = DFF[2];
        endcase
    end

    always @ (rst_n or Mux1) begin
        case (rst_n)
            1'b0: Rst1 = 8'b00000000;
            1'b1: Rst1 = Mux1;
        endcase
    end

    always @ (posedge clk) begin
        DFF[1] <= Rst1;
    end

    // 0th bit
    always @ (wp or wen or Mux0 or DFF[1] or DFF[0]) begin
        case ({wen, wp != 4'b1111})
            default: Mux0 = DFF[0];
            2'b11: Mux0 = DFF[1];
        endcase
    end

    always @ (rst_n or Mux0) begin
        case (rst_n)
            1'b0: Rst0 = 8'b00000000;
            1'b1: Rst0 = Mux0;
        endcase
    end

    always @ (posedge clk) begin
        DFF[0] <= Rst0;
    end

    // read enable
    always @ (*) begin
        dout = DFF[rp];
    end

    always @ (wp or rp or rst_n or ren or wen) begin
        error = ((wp == 4'b1111) && rst_n && wen) || ((rp == 4'b1000) && rst_n && ren && !wen);
    end


endmodule