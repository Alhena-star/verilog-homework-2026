// clk_gen.v
// HW01 激励信号模块：产生周期 20 个时间单位的方波时钟
// 说明：按课堂已订正的 clk_gen.v 模块文件使用，供 cd4017 与 top_tb 调用。
`timescale 1ns/1ps

module clk_gen(clk);
    output clk;

    reg clk;

    initial begin
        clk = 1'b0;
    end

    always #10 clk = ~clk;
endmodule
