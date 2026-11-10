module top_tb;

wire        clk;
reg         en;
reg         clr;
wire [9:0]  q;

clk_gen u_clk_gen(
    .clk(clk)
);

CD4017 u_cd4017(
    .clk(clk),
    .en(en),
    .clr(clr),
    .q(q)
);

initial begin
    // 初始状态
    clr = 1'b1;
    en  = 1'b0;
    #20
    clr = 1'b0;
    en  = 1'b1;

    #220; // 跑够 0~9 一轮

    clr = 1'b1;
    #20
    clr = 1'b0;

    #200;
    $finish;
end

endmodule
