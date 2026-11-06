module top_tb;
		wire clk;
		reg en,clr;
		wire [9:0] q;
		clk_gen u_clk(clk);
		CD4017 u_CD4017(clk,en,clr,q);
		initial
		begin
				en=1'b1;
				clr=1'b1;
				#15;
				clr=1'b0;
				#300;
				$finish;
		end
		initial begin
				$dumpfile("wave.vcd");
				$dumpvars(0,top_tb);
		end
endmodule