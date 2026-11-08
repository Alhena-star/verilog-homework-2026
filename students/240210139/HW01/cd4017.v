`timescale 1ns/1ps

// cd4017.v
// HW01 十进制计数器 CD4017
// 端口：clk 时钟，en 使能，clr 清零，q[9:0] 译码输出
// 功能：clr 为高时计数器清零；en 为高时在 clk 上升沿按 0~9 循环计数；
//       q 为十路译码输出，计数 0 时 q[0] 为高，逐位向后移动

module cd4017(clk, en, clr, q);
    input        clk;
    input        en;
    input        clr;
    output [9:0] q;

    reg [3:0] count;

    // 十进制计数，0~9 循环
    always @(posedge clk or posedge clr) begin
        if (clr)
            count <= 4'b0000;
        else if (en) begin
            if (count == 4'd9)
                count <= 4'b0000;
            else
                count <= count + 1'b1;
        end
    end

    // 十路译码输出
    assign q = 10'b0000000001 << count;
endmodule
