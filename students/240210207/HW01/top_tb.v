module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg en,clr;
	wire [9:0] q;
	CD4017 u_cd4017(clk, en, clr, q);
	initial
	begin
		$dumpfile("clk10");
		$dumpvars(0, top_tb);
		clr=1;
		en=0;
		#30 clr = 0;
			en = 1;
		#200 $finish();
	end
endmodule