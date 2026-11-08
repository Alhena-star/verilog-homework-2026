// clk_gen.v
// 时钟激励模块：产生占空比为 50% 的方波
`timescale 1ns/1ps

module clk_gen(clk);

    output      clk;
    reg         clk;

    parameter   PERIOD = 20;                // 时钟周期，单位 ns

    initial     clk = 1'b0;                 // 赋初值，避免仿真开始时输出为 x

    always #(PERIOD/2) clk = ~clk;          // 每半个周期翻转一次

endmodule
