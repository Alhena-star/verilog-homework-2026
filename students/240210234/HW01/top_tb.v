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
            en = 1'b0;
            clr = 1'b1;
            #20 clr = 1'b0;
            #10 en = 1'b1;
            #120 en = 1'b0;
            #40 en = 1'b1;
            #100 clr = 1'b1;
            #20 clr = 1'b0;
            #160 $finish;
        end

    initial
        begin
            $dumpfile("top_tb.vcd");
            $dumpvars(0, top_tb);
        end

endmodule
