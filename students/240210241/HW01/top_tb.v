// HW01 testbench: CD4017 十进制计数器仿真
// 实例化课堂订正的 clk_gen 产生方波激励，并实例化 cd4017
module top_tb;
    wire        clk;
    wire [9:0]  q;
    reg         en;
    reg         clr;

    clk_gen u_clk_gen (
        .clk(clk)
    );

    cd4017 u_cd4017 (
        .clk(clk),
        .en (en),
        .clr(clr),
        .q  (q)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);

        clr = 1'b1;
        en  = 1'b1;
        #25  clr = 1'b0;           // 释放清零，q[0]=1，开始计数

        #240 en  = 1'b0;           // 拉低使能，计数暂停
        #100 en  = 1'b1;           // 恢复计数

        #200 clr = 1'b1;           // 异步清零，输出回到 q[0]=1
        #30  clr = 1'b0;

        #100 $finish;
    end
endmodule
