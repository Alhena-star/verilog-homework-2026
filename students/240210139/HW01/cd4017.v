// cd4017.v
// HW01 十进制计数器 CD4017
// 端口：clk 时钟，en 使能（高有效），clr 异步清零（高有效），q[9:0] 十路译码输出
// 功能：clr 为高时计数器与输出清零；en 为高时在 clk 上升沿计数 0~9 循环；
//       q 为独热码，高电平随计数向下移动一位（q[0] 对应计数 0）。
`timescale 1ns/1ps

module cd4017(clk, en, clr, q);
    input        clk;
    input        en;
    input        clr;
    output [9:0] q;

    reg [3:0] count;

    // 十进制计数：0~9 循环，clr 异步清零，en 为高才在上升沿计数
    always @(posedge clk or posedge clr) begin
        if (clr)
            count <= 4'd0;
        else if (en) begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end
    end

    // 独热码译码：计数 0 时 q[0] 为高，计数 9 时 q[9] 为高
    assign q = 10'b0000000001 << count;
endmodule
