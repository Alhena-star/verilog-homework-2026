`timescale 1ns/1ps

// HW01 测试平台：实例化 clk_gen 与 cd4017，验证计数、使能与异步清零
module top_tb;

    wire       clk;
    reg        en;
    reg        clr;
    wire [9:0] q;

    // 方波激励模块
    clk_gen u_clk_gen(
        .clk(clk)
    );

    // 被测十进制计数器
    cd4017 u_cd4017(
        .clk(clk),
        .en(en),
        .clr(clr),
        .q(q)
    );

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        // 初始状态：清零有效，使能有效
        en  = 1'b1;
        clr = 1'b1;
        #25  clr = 1'b0;        // 释放清零，开始正常计数

        // 计数到第 6 个输出后暂停，观察 en 的使能作用
        #200 en = 1'b0;
        #60  en = 1'b1;

        // 计数过程中给出异步清零，观察 q 立即回到 q[0]
        #200 clr = 1'b1;
        #15  clr = 1'b0;

        #300 $finish;
    end

endmodule
