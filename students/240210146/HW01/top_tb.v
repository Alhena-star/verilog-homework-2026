timescale 1ns/1ps
module top_tb;
    wire clk;
    reg en,clr;
    wire [9:0] q;

    clk_gen u_clk(clk);
    CD4017 u_cd4017(clk,en,clr,q);

    initial
    begin
        $dumpfile("cd4017.vcd");
        $dumpvars(0,top_tb);

        en = 0;
        clr = 1;
        #25 clr = 0;
        #20 en = 1;
        #240 en = 0;
        #60 en = 1;
        #40 clr = 1;
        #20 clr = 0;
        #220 $finish;
    end
endmodule
