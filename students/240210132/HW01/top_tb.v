`timescale 1ns/1ps

// top_tb.v
// CD4017 仿真测试顶层：clk_gen 产生 20ns 方波，依次验证异步清零、使能计数和计数保持
module top_tb;
    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    // 课堂订正的方波激励模块
    clk_gen u_clk_gen(clk);

    // 被测电路：十进制计数器 CD4017
    cd4017 u_cd4017(clk, en, clr, q);

    initial begin
        $dumpfile("report.vcd");
        $dumpvars(0, top_tb);

        en = 1'b0;
        clr = 1'b0;

        // 阶段 1：异步清零，输出回到 q[0] = 1
        #3 clr = 1'b1;
        #22 clr = 1'b0;

        // 阶段 2：使能计数，输出在 q[0]~q[9] 之间依次移位
        #10 en = 1'b1;
        #190 en = 1'b0;

        // 阶段 3：关闭使能，计数值保持不变（q[9] 继续为高）
        #65;

        // 阶段 4：再次异步清零，输出立即回到 q[0]
        #5 clr = 1'b1;
        #20 clr = 1'b0;

        #20 $finish;
    end
endmodule