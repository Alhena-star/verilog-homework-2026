// clk_gen.v
// 时钟激励模块：产生占空比 50% 的方波，作为 CD4017 的计数时钟
`timescale 1ns/1ps

module clk_gen(clk);

    output      clk;
    reg         clk;

    parameter   PERIOD = 20;            // 时钟周期，单位 ns

    initial     clk = 1'b0;             // 上电先置低，避免输出停在 X 态

    always #(PERIOD/2) clk = ~clk;      // 每半个周期翻转一次

endmodule
