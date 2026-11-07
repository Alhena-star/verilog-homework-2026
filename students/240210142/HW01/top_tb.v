// top_tb.v
// CD4017 流水灯仿真测试平台
// 例化 clk_gen 产生时钟，例化 cd4017 观察 q[9:0] 的循环移位
`timescale 1ns/1ps

module top_tb;

    wire       clk;
    reg        en;
    reg        clr;
    wire [9:0] q;

    // 时钟激励
    clk_gen u_clk(clk);

    // 被测电路
    cd4017 u_cd4017(clk, en, clr, q);

    // 波形输出
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    // 输入激励
    initial begin
        en  = 1'b1;
        clr = 1'b1;      // 先清零，q 停在 Q0
        #25  clr = 1'b0; // 释放清零，开始流水
        #182 en  = 1'b0; // 关使能，输出应保持不变
        #57  en  = 1'b1; // 恢复使能，继续移位
        #124 clr = 1'b1; // 再次异步清零，验证清零优先
        #16  clr = 1'b0; // 释放清零
        #140 $finish;
    end

endmodule
