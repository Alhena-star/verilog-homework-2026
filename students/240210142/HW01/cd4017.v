// cd4017.v
// 十进制计数器 / 环形流水灯
// clr 高电平异步清零，q 复位为 10'b00_0000_0001（Q0 有效）
// en 为高电平时，时钟上升沿把有效的 "1" 依次移位，实现流水灯效果
module cd4017(clk, en, clr, q);
    input        clk;
    input        en;
    input        clr;
    output [9:0] q;
    reg    [9:0] q;

    always @(posedge clk or posedge clr) begin
        if (clr)
            q <= 10'b00_0000_0001;
        else if (en)
            q <= {q[8:0], q[9]};   // 循环左移：Q9 回到 Q0
    end
endmodule
