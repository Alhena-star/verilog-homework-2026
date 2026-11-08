`timescale 1ns/1ps

module top_tb;
    reg en;
    reg clr;
    wire clk;
    wire [9:0] q;

    clk_gen u_clk(clk);

    CD4017 u_cd4017(clk, en, clr, q);

    initial
    begin
        en = 0;
        clr = 1;

        #5;
        clr = 0;
        en = 1;

        #200;
        en = 0;

        #40;
        en = 1;

        #100;
        clr = 1;

        #10;
        clr = 0;

        #100;
        $finish;
    end

    initial
    begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
    end

endmodule