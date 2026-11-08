`timescale 1ns/1ps
module top_tb;
    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u_clk_gen(clk);
    CD4017 u_cd4017(clk,en,clr,q);

    initial
    begin
        $dumpfile("cd4017.vcd");
        $dumpvars(0,top_tb);

        en = 1'b0;
        clr = 1'b1;
        #25 clr = 1'b0;
        #20 en = 1'b1;
        #240 en = 1'b0;
        #60 en = 1'b1;
        #40 clr = 1'b1;
        #20 clr = 1'b0;
        #220 $finish;
    end
endmodule
