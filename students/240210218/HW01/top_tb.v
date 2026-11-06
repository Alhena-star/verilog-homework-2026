module top_tb;
    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u_clk_gen(clk);
    cd4017 u_cd4017(clk, en, clr, q);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);

        clr = 1;
        en = 0;
        #25;
        clr = 0;
        en = 1;

        #250;
        en = 0;
        #60;
        en = 1;

        #140;
        clr = 1;
        #30;
        clr = 0;

        #200;
        $finish;
    end
endmodule
