module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg clr;
	reg en;
	wire[9:0] q;
	CD4017 u_cd4017(clk, en, clr, q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars;
		clr = 1;
		en = 1;
		#15 clr = 0;
		#240 en = 0;
		#80 en = 1;
		#65 clr = 1;
		#15 clr = 0;
		#55 $finish;
	end
endmodule
