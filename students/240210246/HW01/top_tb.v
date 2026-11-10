module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg clr;
	reg en;
	wire[9:0] q;
	cd4017 u_cd4017(clk,en,clr,q);
	
	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars();
		clr = 1;
		en = 0;
		#25 clr = 0;
		#50 en = 1;
		#220 en = 0;
		#20 clr = 1;
		#20 clr = 0;
		#40 $finish();
	end

endmodule
