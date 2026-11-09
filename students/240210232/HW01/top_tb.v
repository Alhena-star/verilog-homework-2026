`timescale 1ns/1ps

module top_tb;
	wire clk;
	reg en;
	reg clr;
	wire [9:0] q;

	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017(clk, en, clr, q);

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars(0, top_tb);

		clr = 1'b1;
		en = 1'b0;

		#25 clr = 1'b0;
		en = 1'b1;

		#375 en = 1'b0;
		#60 en = 1'b1;

		#100 clr = 1'b1;
		#20 clr = 1'b0;

		#120 $finish;
	end
endmodule
