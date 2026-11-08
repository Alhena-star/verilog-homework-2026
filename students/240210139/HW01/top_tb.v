`timescale 1ns/1ps

// top_tb.v
// HW01 测试程序：实例化 clk_gen 产生方波激励，驱动 cd4017 十进制计数器
// 测试内容：上电清零 -> 使能计数（q[0] 到 q[9] 依次为高，9 之后回到 q[0]）
//          -> 关闭使能保持 -> 异步清零 -> 重新计数

module top_tb;
    wire       clk;
    reg        en;
    reg        clr;
    wire [9:0] q;

    // 把十进制计数器的十路输出分开，便于在波形中逐位观察
    wire [9:0] q_bit;

    // 激励信号模块
    clk_gen u_clk_gen(clk);

    // 被测模块
    cd4017 u_cd4017(clk, en, clr, q);

    assign q_bit = q;

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        en  = 1'b0;
        clr = 1'b1;
        #22;
        clr = 1'b0;

        en = 1'b1;
        #218;

        en = 1'b0;
        #40;

        clr = 1'b1;
        #22;
        clr = 1'b0;
        en  = 1'b1;

        #120;
        $finish;
    end
endmodule
