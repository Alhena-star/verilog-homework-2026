// CD4017: 十进制计数器 (Johnson counter)，输出 q[9:0] 依次置 1
// en : 使能端，en=1 时每个时钟上升沿计数
// clr: 清零端，clr=1 时异步清零，输出复位为 q[0]=1
module cd4017(clk, en, clr, q);
    input           clk;
    input           en;
    input           clr;
    output reg [9:0] q;

    always @(posedge clk or posedge clr) begin
        if (clr)
            q <= 10'b0000000001;
        else if (en)
            q <= {q[8:0], q[9]};
    end
endmodule
