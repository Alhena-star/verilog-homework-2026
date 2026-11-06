// ============================================================
// 240210117 乐奕子豪  HW01  :  测试平台
// ------------------------------------------------------------
// 同时实例化 clk_gen 与 cd4017，观察 q[9:0] 与 carry_out：
//   t = 0    : clr = 1, en = 0，异步清零（q = 10'b0000000001）
//   t = 25   : 释放 clr，en = 1，开始计数（20 个时钟 = 2 个完整循环）
//   t = 425  : en = 0，暂停 60 ns，验证使能端有效
//   t = 485  : en = 1，继续计数
//   t = 700  : $finish
// 波形文件：report.vcd（GTKWave 打开）
// ============================================================
`timescale 1ns / 1ps

module top_tb;

    wire       clk;
    reg        clr;
    reg        en;
    wire [9:0] q;
    wire       carry_out;

    // 时钟激励：50 MHz，周期 20 ns
    clk_gen u_clk_gen (.clk(clk));

    // 被测模块
    cd4017 u_cd4017 (
        .clk       (clk),
        .clr       (clr),
        .en        (en),
        .q         (q),
        .carry_out (carry_out)
    );

    initial begin
        $dumpfile("report.vcd");
        $dumpvars(0, top_tb);

        clr = 1'b1;
        en  = 1'b0;

        #25 begin
            clr = 1'b0;     // 释放异步复位
            en  = 1'b1;     // 开始计数
        end

        #400 begin
            en = 1'b0;      // 暂停计数，验证 en 有效
            #60 en = 1'b1;  // 恢复计数
        end

        #215 $finish;
    end

    // 终端打印，便于不开波形时快速核对
    initial begin
        $monitor("t=%0d ns  clr=%b  en=%b  q=%b  carry_out=%b",
                 $time, clr, en, q, carry_out);
    end

endmodule
