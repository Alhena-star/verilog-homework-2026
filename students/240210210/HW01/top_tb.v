`timescale 1ns / 1ps
module top_tb;
    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u_clk(clk);
    cd4017 u_cd4017(clk, en, clr, q);

    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0);
        clr = 1'b1;
        en = 1'b0;
        #20 clr = 1'b0;
        #400 clr = 1'b1;
        #50 $finish;
    end
endmodule
