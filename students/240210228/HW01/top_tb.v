`timescale 1ns/1ps

module top_tb;
    wire clk;
    reg en, clr;
    wire [9:0] q;
    integer errors;

    // Positional port connections, as required by the course.
    clk_gen u_clk(clk);
    cd4017 u_cd4017(clk, en, clr, q);

    initial
    begin
        $dumpfile("HW01.vcd");
        $dumpvars(0, top_tb);
        errors = 0;
        en = 1'b0;
        clr = 1'b0;

        // Assert clear asynchronously, then start counting.
        #2 clr = 1'b1;
        #1;
        if (q !== 10'b0000_0000_01)
            errors = errors + 1;
        #16 clr = 1'b0;
        #2 en = 1'b1;

        // Check Q9 after nine enabled rising edges.
        #170;
        if (q !== 10'b10_0000_0000)
            errors = errors + 1;

        // Check rollover Q9 -> Q0 after ten rising edges.
        #20;
        if (q !== 10'b0000_0000_01)
            errors = errors + 1;

        // The next count is Q1. Disable at 241ns and verify hold.
        #30 en = 1'b0;
        #64;
        if (q !== 10'b0000_0000_10)
            errors = errors + 1;

        // Count again, then assert asynchronous clear at 352ns.
        en = 1'b1;
        #47 clr = 1'b1;
        #1;
        if (q !== 10'b0000_0000_01)
            errors = errors + 1;
        #12 clr = 1'b0;
        #80;

        if (errors == 0)
            $display("HW01 TEST PASS");
        else
            $display("HW01 TEST FAIL: %0d errors", errors);
        $finish;
    end
endmodule
