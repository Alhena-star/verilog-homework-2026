module cd4017(clk,en,clr,q);
input clk, en, clr;
output reg [9:0] q;
reg [3:0] count;            // 十进制计数 0~9，必须 4 位（草稿里写成 1 位是错的）

always@(posedge clk or posedge clr)
begin
    if(clr)
        count <= 4'd0;                        // 异步清零
    else if(en)
        count <= (count == 4'd9) ? 4'd0 : count + 4'd1;   // 9 之后回 0
end

always@(*)
    q = 10'b0000000001 << count;              // 独热译码，始终只有一位为 1
endmodule
