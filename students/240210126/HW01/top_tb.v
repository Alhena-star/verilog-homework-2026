module top_tb;
    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u_clk(clk);
    CD4017 u_cd4017(clk, en, clr, q);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        clr = 1;
        en = 1;
        #25 clr = 0;
        #300 en = 0;
        #120 en = 1;
        #120 clr = 1;
        #20 clr = 0;
        #200 $finish;
    end
endmodule
