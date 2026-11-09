module top_tb;
wire clk;
reg clr, en;
wire [9:0] q;

clk_gen u_clk(.clk(clk));
cd4017 u_4017(
    .clk(clk),
    .clr(clr),
    .en(en),
    .q(q)
);

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
    clr = 1; en = 1;
    #15 clr = 0; en = 0; // 释放清零、打开使能
    #200 $finish;
end
endmodule
