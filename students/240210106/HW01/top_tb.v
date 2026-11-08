module top_tb;
wire clk;
reg en,clr;
wire [9:0] q;
clk_gen u_clk(clk);
cd4017 u_cd4017(clk,en,clr,q);
initial
    begin
    $dumpfile("done");
    $dumpvars();
    en=0;clr=0;
    #10 clr=1;
    #10 clr=0;
    #10 en=1;
    #120 en=0;
    #30 en=1;
    #100 clr=1;
    #10 $finish;
    end
endmodule
