// cd4017.v
// 十进制计数器 CD4017：en 使能，clr 异步清零，q[9:0] 为十路译码输出（one-hot）
`timescale 1ns/1ps

module cd4017(clk, en, clr, q);

    input        clk;                   // 计数时钟，上升沿有效
    input        en;                    // 使能端，高电平允许计数
    input        clr;                   // 清零端，高电平异步清零
    output [9:0] q;                     // 十路输出，任一时刻只有一位为 1

    reg    [9:0] q;

    always @(posedge clk or posedge clr) begin
        if (clr)
            q <= 10'b00000_00001;       // 清零后 Q0 输出高电平
        else if (en)
            q <= {q[8:0], q[9]};        // 环行移位：Q0→Q1→…→Q9→Q0
    end

endmodule
