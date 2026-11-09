module top_tb;
	wire clk;
	reg en;
	reg clr;
	wire[9:0] q;

clk_gen u_clk(clk);
CD4017 u_cd4017(clk,en,clr,q);

initial begin
    $dumpfile("top_tb.vcd");
    $dumpvars();
    en=1;
    clr=1;
    #25 clr=0;
    #180 en=0;
    #70 en=1;
    #70 clr=1;
    #20 clr=0;
    #50 $finish();
end
endmodule
