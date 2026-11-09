module top_tb;
    wire clk;
    reg en;
    reg clr;
    wire [9:0] q;

    clk_gen u_clk(clk);
    cd4017 u_cd4017(clk, en, clr, q);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
        
        en = 1;
        clr = 1;
        #25 clr = 0;
        
        #300;
        $finish;
    end
endmodule
