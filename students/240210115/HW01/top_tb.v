`timescale 1ns/1ns
module top_tb;
	wire clk;
	reg en;
	reg clr;
	wire[9:0] q;

	clk_gen u_clk(clk);
	cd4017 u_cd4017(clk,en,clr,q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
	end

	initial
	begin
		en=1;
		clr=0;
		#1 clr=1;
		#24 clr=0;
		#190 en=0;
		#40 en=1;
		#40 clr=1;
		#20 clr=0;
		#80 $finish;
	end
endmodule
