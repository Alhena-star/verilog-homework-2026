// ============================================================
// 240210117 乐奕子豪  HW01  :  CD4017 十进制计数器
// ------------------------------------------------------------
// clk       : 时钟，50 MHz 方波（周期 20 ns）
// clr       : 异步清零，高有效
// en        : 计数使能，高有效；en = 0 时计数保持
// q[9:0]    : 一位热码输出，count = n 时仅 q[n] 为高（Q0..Q9）
// carry_out : 进位，当前状态为 9 时为高（Q9 -> Q0 前一拍给出）
//
// 说明：题目给定端口名为 clr / en / q[9:0]，与课堂订正版 clk_gen.v 配套使用。
// ============================================================
`timescale 1ns / 1ps

module cd4017 (
    input  wire       clk,
    input  wire       clr,
    input  wire       en,
    output wire [9:0] q,
    output wire       carry_out
);

    reg [3:0] count;

    // 十进制计数：0 -> 1 -> ... -> 9 -> 0，clr 优先
    always @(posedge clk or posedge clr) begin
        if (clr)
            count <= 4'd0;
        else if (en) begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end
    end

    // 一位热码译码：count = n 时 q[n] = 1
    assign q = 10'b1 << count;

    // 进位输出
    assign carry_out = (count == 4'd9);

endmodule
