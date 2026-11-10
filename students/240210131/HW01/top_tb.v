module top_tb;
	wire	clk;
	reg	clr;
	reg	en;

	wire	[9:0]	q;

	clk_gen u_clk_gen(clk);

	CD4017 u_cd4017(clk, en, clr, q);

	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0, top_tb);

		clr = 1;
		en = 1;
		#35;
		clr = 0;

		#400;
		$finish;
	end
endmodule
