module top_tb;
    wire clk;
    reg en;
    reg clr;
    clk_gen u_clk(clk);
    wire[9:0] q;
    cd4017 u_cd4017(clk,en,clr,q);

    initial
    begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0,top_tb);
        en=1;
        clr=1;
        #25 clr=0;
        #325 en=0;
        #45 en=1;
        #100 clr=1;
        #30 clr=0;
        #200 $finish;
    end
endmodule
