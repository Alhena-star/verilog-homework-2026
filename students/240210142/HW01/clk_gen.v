// clk_gen.v
// 时钟激励产生（课堂订正版：必须声明 timescale，否则 #10 与 tb 的 1ns 不在同一时间单位）
`timescale 1ns/1ps
// 输出周期 20ns 的方波：0~10ns 为 0，10~20ns 为 1
module clk_gen(clk);
    output clk;
    reg    clk;

    initial begin
        clk = 1'b0;           // 起始电平为 0，避免 x 态
        forever #10 clk = ~clk;  // 每 10ns 翻转一次
    end
endmodule
