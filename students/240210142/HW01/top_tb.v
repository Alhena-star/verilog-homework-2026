`timescale 1ns/1ps

module top_tb;

	wire clk;
	wire [9:0] q;
	reg en;
	reg clr;

	clk_gen u_clk(clk);
	CD4017 u_cd4017(clk, en, clr, q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0, top_tb);
	end

	initial
	begin
		en  = 1'b1;
		clr = 1'b1;
		#25  clr = 1'b0;
		#182 en  = 1'b0;
		#57  en  = 1'b1;
		#124 clr = 1'b1;
		#16  clr = 1'b0;
		#140 $finish;
	end
endmodule
