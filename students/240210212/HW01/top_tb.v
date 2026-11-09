module top_tb;
	wire clk;
	reg en,clr;
	wire [9:0] q;
	clk_gen u_clk(clk);
	CD4017 u_cd4017(clk,en,clr,q);
	initial begin
	$dumpfile("wave.vcd");
	$dumpvars;
	clr=1;
	en=0;
	#20
	clr=0;
	en=1;
	#200
	clr=1;
	#20
	clr=0;
	#100
	$finish;
	end
endmodule