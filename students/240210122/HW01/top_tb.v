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
