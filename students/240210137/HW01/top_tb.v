`timescale 1ns/1ns
//----------------------------------------------------------------------
// top_tb.v  --  CD4017 十进制计数器仿真测试平台
//
// 例化关系：
//   u_clk_gen : clk_gen 模块，产生周期 20ns 的方波，作为计数时钟
//   u_cd4017  : 被测的 CD4017 十进制计数器
//
// 激励时序（clk 上升沿出现在 10ns、30ns、50ns …）：
//   0～25ns    clr=1，en=0    异步清零，输出停在 Q0
//   25～45ns   clr=0，en=0    清零撤销但未使能，输出保持 Q0
//   45～245ns  clr=0，en=1    正常计数，Q0 依次移向 Q9 并循环
//   245～305ns clr=0，en=0    撤销使能，计数暂停，输出保持
//   305～345ns clr=0，en=1    恢复使能，继续计数
//   345～365ns clr=1，en=1    计数过程中异步清零，输出立即回到 Q0
//   365～460ns clr=0，en=1    清零释放后重新计数
//   460ns                     仿真结束
//----------------------------------------------------------------------

module top_tb;

wire       clk;                         // clk_gen 产生的方波
reg        en;                          // 计数使能
reg        clr;                         // 异步清零
wire [9:0] q;                           // 十进制输出

clk_gen u_clk_gen(clk);
CD4017  u_cd4017(clk, en, clr, q);

initial
begin
    $dumpfile("wave.vcd");              // 波形文件，供 GTKWave 查看
    $dumpvars(0, top_tb);               // 记录 top_tb 中的全部信号

    $monitor("time = %0t ns : clk = %b en = %b clr = %b q = %b",
             $time, clk, en, clr, q);

    clr = 1'b1;                         // 上电先清零
    en  = 1'b0;

    #25 clr = 1'b0;                     // 撤销清零
    #20 en  = 1'b1;                     // 开始计数

    #200 en = 1'b0;                     // 撤销使能，计数暂停
    #60 en  = 1'b1;                     // 恢复使能，继续计数

    #40 clr = 1'b1;                     // 计数途中异步清零
    #20 clr = 1'b0;                     // 撤销清零，重新计数

    #95 $finish;                        // 结束仿真
end

endmodule
