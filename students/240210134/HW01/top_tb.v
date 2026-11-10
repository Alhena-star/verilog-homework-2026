module top_tb;

    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u1 (clk);
    cd4017 u2 (clk, en, clr, q);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top_tb);
        clr = 1;
        en = 0;
        #25;
        clr = 0;
        en = 1;
        #250;
        $finish;
    end

endmodule
