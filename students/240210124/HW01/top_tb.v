`timescale 1ns/1ns

module top_tb;

wire        clk;
reg         en;
reg         clr;
wire [9:0]  q;

clk_gen u1(clk);
CD4017  u2(clk, en, clr, q);

initial
begin
    clr = 1'b1;
    en  = 1'b0;
    #12;
    clr = 1'b0;
    #8;
    en  = 1'b1;
    #320;
    $finish;
end

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

endmodule
