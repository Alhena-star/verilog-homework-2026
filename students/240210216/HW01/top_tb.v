`timescale 1ns/1ps
module top_tb;
		wire clk;
		reg en;
		reg clr;
		wire[9:0] q;

		clk_gen u_clk(clk);
		CD4017 u_cd4017(clk, en, clr, q);

		initial
		begin
				$dumpfile("wave.vcd");
				$dumpvars(0, top_tb);
				$timeformat(-9, 0, " ns", 10);
				$monitor("t=%0t  clk=%b  en=%b  clr=%b  q=%b", $time, clk, en, clr, q);

				en  = 1'b1;
				clr = 1'b1;       
				#25  clr = 1'b0;

				#405 $finish;
		end
endmodule