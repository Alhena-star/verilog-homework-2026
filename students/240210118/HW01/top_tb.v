module top_tb;
wire clk;
reg en;
reg clr;
wire [9:0] q;

clk_gen u_clk(clk);
cd4017 u_cd4017(clk, en, clr, q);

initial
begin
    $dumpfile("wave.vcd");  // 波形文件，GTKWave 打开
    $dumpvars();
    en = 1;  clr = 1;       // 上电清零
    #20  clr = 0;           // 20ns 释放清零，开始十进制计数
    #180 en = 0;            // 200ns 拉低使能，验证计数暂停
    #60  en = 1;            // 260ns 恢复计数
    #160 clr = 1;           // 420ns 给出异步清零脉冲
    #20  clr = 0;           // 440ns 释放
    #200 $finish();
end
endmodule
