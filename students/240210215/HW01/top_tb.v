// top_tb.v
// 测试程序：调用 clk_gen 产生方波时钟，驱动 cd4017 完成十进制计数
`timescale 1ns/1ps

module top_tb;

    wire            clk;                    // 时钟信号，由 clk_gen 提供
    reg             en;                     // 使能激励
    reg             clr;                    // 清零激励
    wire    [9:0]   q;                      // 计数器输出

    clk_gen u_clk_gen(clk);                 // 实例化时钟激励模块

    cd4017 u_cd4017(clk, en, clr, q);       // 实例化被测模块

    initial                                 // 生成波形文件，供仿真软件查看
        begin
            $dumpfile("top_tb.vcd");
            $dumpvars(0, top_tb);
        end

    initial
        begin
            en  = 1'b1;
            clr = 1'b1;                     // 先异步清零，输出停在 Q0
            #25     clr = 1'b0;             // 撤销清零，开始计数

            #250    en  = 1'b0;             // 使能变低，计数保持
            #80     en  = 1'b1;             // 恢复计数

            #200    clr = 1'b1;             // 计数过程中异步清零
            #20     clr = 1'b0;

            #160    $finish;
        end

endmodule
