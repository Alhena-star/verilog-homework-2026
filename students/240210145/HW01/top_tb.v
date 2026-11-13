module top_tb;
wire		clk;
reg		clr;
reg		en;
wire	[9:0]	q;

clk_gen u_clk(clk);
cd4017 u_cd4017(clk,en,clr,q);

initial
begin
	$dumpfile("cd4017_tb.vcd");
	$dumpvars(0,top_tb);

	clr = 1;
	en  = 1;

	#20  clr = 0;
	#240 clr = 1;
	#20  clr = 0;
	#120 en  = 0;
	#40  en  = 1;
	#40  $finish;
end
endmodule
