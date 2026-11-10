module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg clr;
	reg en;
	wire[9:0] q;
	cd4017 u_cd4017(clk,en,clr,q);

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars;
		clr = 1;
		en = 1;
		#25 clr = 0;
		#180 en = 0;
		#70 en = 1;
		#70 clr = 1;
		#20 clr = 0;
		#50 $finish;
	end
endmodule
