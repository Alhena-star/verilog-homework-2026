// top_tb.v
// Testbench for the CD4017 decade counter.
// clk_gen supplies the clock, cd4017 is the device under test.

`timescale 1ns/1ps

module top_tb;

    wire       clk;
    reg        clr;
    reg        en;
    wire [9:0] q;

    clk_gen u_clk_gen(clk);
    cd4017 u_cd4017(clk, clr, en, q);

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial begin
        clr = 1'b1;
        en  = 1'b0;

        #30  clr = 1'b0;
        #20  en  = 1'b1;

        #110 en  = 1'b0;
        #30  clr = 1'b1;
        #20  clr = 1'b0;
        #20  en  = 1'b1;

        #70  en  = 1'b0;

        #50  $finish;
    end

endmodule
