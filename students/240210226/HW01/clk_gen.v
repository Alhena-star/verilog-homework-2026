`timescale 1ns / 1ns
//----------------------------------------------------------------------
// clk_gen.v  --  方波(时钟)激励产生模块
//
// 说明:本模块用于测试平台,为被测电路提供周期为 2*HALF_PERIOD 的方波。
//       默认 HALF_PERIOD = 10,即高低电平各保持 10ns,完整周期 20ns。
//       在 top_tb.v 中实例化后直接接到 CD4017 的 clk 端。
//----------------------------------------------------------------------

module clk_gen
#(
    parameter HALF_PERIOD = 10          // 半周期,单位 ns
)
(
    output reg clk                      // 方波输出
);

    initial begin
        clk = 1'b0;                     // 上电时从低电平开始
    end

    always #HALF_PERIOD clk = ~clk;     // 每隔半个周期翻转一次

endmodule
