module top_tb;
	wire clk;
	reg en;
	reg clr;
	wire [9:0] q;

	clk_gen u_clk_gen(clk);
	CD4017 u_cd4017(clk,clr,en,q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);

		clr = 1;
		en = 0;
		#30 clr = 0;
		en = 1;
		#180 en = 0;
		#40 clr = 1;
		#20 clr = 0;
		#20 $finish;
	end
endmodule