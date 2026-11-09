`timescale 1ns/1ps

// 十进制计数器 CD4017：en 为使能端（高有效），clr 为异步清零端（高有效），q[9:0] 为十路译码输出
module cd4017(clk, en, clr, q);

    input       clk;
    input       en;
    input       clr;
    output [9:0] q;

    reg [3:0] cnt;
    reg [9:0] q;

    // 十进制计数：0~9 循环，en 为高时在时钟上升沿加 1，clr 异步清零
    always @(posedge clk or posedge clr) begin
        if (clr)
            cnt <= 4'd0;
        else if (en) begin
            if (cnt == 4'd9)
                cnt <= 4'd0;
            else
                cnt <= cnt + 1'b1;
        end
    end

    // 十路译码：计数值对应的输出为高，其余为低
    always @(*) begin
        case (cnt)
            4'd0: q = 10'b00000_00001;
            4'd1: q = 10'b00000_00010;
            4'd2: q = 10'b00000_00100;
            4'd3: q = 10'b00000_01000;
            4'd4: q = 10'b00000_10000;
            4'd5: q = 10'b00001_00000;
            4'd6: q = 10'b00010_00000;
            4'd7: q = 10'b00100_00000;
            4'd8: q = 10'b01000_00000;
            4'd9: q = 10'b10000_00000;
            default: q = 10'b00000_00001;
        endcase
    end

endmodule
