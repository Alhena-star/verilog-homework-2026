// top_tb.v
// 测试程序：实例化 clk_gen 与 cd4017，观察使能、清零和环行计数过程
`timescale 1ns/1ps

module top_tb;

    wire        clk;                    // 时钟：由 clk_gen 产生
    reg         en;                     // 使能激励
    reg         clr;                    // 清零激励
    wire [9:0]  q;                      // CD4017 输出

    // 时钟激励模块（课堂订正的 clk_gen.v）
    clk_gen u_clk_gen(
        .clk (clk)
    );

    // 被测模块
    cd4017 u_cd4017(
        .clk (clk),
        .en  (en),
        .clr (clr),
        .q   (q)
    );

    initial begin                       // 波形文件，供 GTKWave 查看
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        en  = 1'b1;
        clr = 1'b1;                     // 先异步清零，输出停在 Q0
        #25  clr = 1'b0;                // 放开清零，开始计数

        #200 en  = 1'b0;                // 使能拉低，计数保持
        #60  en  = 1'b1;                // 恢复计数

        #200 clr = 1'b1;                // 计数过程中异步清零
        #20  clr = 1'b0;                // 重新从 Q0 开始计数

        #150 $finish;
    end

endmodule
