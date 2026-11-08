`timescale 1ns/1ps

module top_tb;
    wire clk;
    reg en, clr;
    wire [9:0] q;

    clk_gen u_clk(clk);
    cd4017 u_cd4017(clk, en, clr, q);

    initial begin
        $dumpfile("done.vcd");
        $dumpvars(0, top_tb);

        en = 1'b0;
        clr = 1'b1;
        #25 clr = 1'b0;
            en = 1'b1;

        #240 en = 1'b0;
        #40  en = 1'b1;
        #100 clr = 1'b1;
        #20  clr = 1'b0;
        #100 $finish;
    end
endmodule
