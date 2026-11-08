module top_tb;
	wire clk;
	reg en;
	reg clr;
	wire [9:0] q;
	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017(clk,en,clr,q);
	initial
	begin
		$dumpfile("wave.vcd");
		$dumpvars(0,top_tb);
		clr=1'b1;
		en=1'b0;
		#40 clr=1'b0;
		#20 en=1'b1;
		#220 en=1'b0;
		#40 clr=1'b1;
		#40 clr=1'b0;
		#20 en=1'b1;
		#120 $finish;
	end
endmodule
