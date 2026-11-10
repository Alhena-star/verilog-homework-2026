`timescale 1ns/1ps
module top_tb;
    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u_clk(clk);
    cd4017 u_cd4017(clk, en, clr, q);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        en = 0;
        clr = 1;
        #25 clr = 0;
        #20 en = 1;
        #90 en = 0;
        #45 en = 1;
        #201 clr = 1;
        #20 clr = 0;
        #59 $finish;
    end
endmodule
