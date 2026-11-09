`timescale 1ns/1ps

module top_tb;

    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u_clk_gen(clk);
    cd4017 u_cd4017(clk, en, clr, q);

    initial
        begin
            en  = 1'b0;
            clr = 1'b1;
            #25  clr = 1'b0;
            #15  en  = 1'b1;
            #130 en  = 1'b0;
            #50  en  = 1'b1;
            #110 clr = 1'b1;
            #25  clr = 1'b0;
            #180 $finish;
        end

    initial
        begin
            $dumpfile("top_tb.vcd");
            $dumpvars(0, top_tb);
        end

endmodule
