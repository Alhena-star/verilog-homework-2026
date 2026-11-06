// top_tb.v
// HW01 测试程序：实例化 clk_gen 产生方波激励，驱动 cd4017 十进制计数器
// 测试内容：1) 上电初值  2) en=1 连续计数（含 9->0 循环）
//          3) en=0 保持   4) clr 异步清零后重新计数
`timescale 1ns/1ps

module top_tb;
    wire       clk;
    reg        en;
    reg        clr;
    wire [9:0] q;

    // 激励信号模块：方波时钟
    clk_gen u_clk_gen(.clk(clk));

    // 被测模块：十进制计数器 CD4017
    cd4017 u_cd4017(
        .clk(clk),
        .en (en),
        .clr(clr),
        .q  (q)
    );

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    // 激励过程
    initial begin
        en  = 1'b0;
        clr = 1'b1;     // 上电先清零
        #22;
        clr = 1'b0;

        // 第 1 段：使能计数，观察 q[0] -> q[9] 依次为高，9 之后回到 q[0]
        en = 1'b1;
        #218;

        // 第 2 段：关闭使能，计数保持（count 停在 1，q[1] 保持为高）
        en = 1'b0;
        #40;

        // 第 3 段：异步清零，计数与输出立即复位
        clr = 1'b1;
        #22;
        clr = 1'b0;
        en  = 1'b1;

        // 第 4 段：清零后重新开始计数
        #120;

        $finish;
    end
endmodule
