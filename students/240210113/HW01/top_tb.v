`timescale 1ns / 1ps
module tb;
wire clk;
reg en, clr;
wire [9:0] q;

clk_gen u_clk(.clk(clk));
CD4017 u_cd4017(
    .clk(clk),
    .en(en),
    .clr(clr),
    .q(q)
);

initial begin
    clr = 1;
    en = 0;
    #15
    clr = 0;
    en = 1;
    #120
    clr = 1;
    #10
    clr = 0;
    #50
    $finish;
end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb);
end
endmodule