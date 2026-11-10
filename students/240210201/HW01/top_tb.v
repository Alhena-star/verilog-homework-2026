module top_tb;

wire clk;
reg en;
reg clr;
wire [9:0] q;

clk_gen u_clk(
    .clk(clk)
);
cd4017 u_cd4017(
    .clk(clk),
    .en(en),
    .clr(clr),
    .q(q)
);

initial begin
    en = 0;
    clr = 1;
    #10;
    clr = 0;
    en = 1;
    #200;
    en = 0;
    #50;
    en = 1;
    #100;
    clr = 1;
    #10;
    clr = 0;
    #100;
    $finish;
end
