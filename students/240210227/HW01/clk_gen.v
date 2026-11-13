`timescale 1ns/1ps

// 方波激励产生模块：输出占空比 50% 的周期方波
module clk_gen(clk);

    output clk;

    parameter PERIOD = 20;      // 时钟周期，单位 ns

    reg clk;

    initial begin
        clk = 1'b0;
    end

    always #(PERIOD / 2) clk = ~clk;

endmodule
