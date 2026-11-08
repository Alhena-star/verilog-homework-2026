`timescale 1ns/1ps

// clk_gen.v
// HW01 激励信号模块：方波时钟
// 课堂订正版模块文件，由 cd4017 与 top_tb 调用

module clk_gen(clk);
    output clk;

    reg clk;

    initial begin
        clk = 1'b0;
    end

    always #10 clk = ~clk;
endmodule
