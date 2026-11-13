module	top_tb;
		wire	clk;
		clk_gen	u_clk(clk);
		reg	clr;
		reg	en;
		wire[9:0]	q;
		cd4017	u_cd4017(clk,clr,en,q);
		initial
		begin
				$dumpfile("wave.vcd");
				$dumpvars(0,	top_tb);
				clr=0;
				en=0;
				clr=1;
				#30	clr=0;
				#200;
				clr=1;
				#20	clr=0;
				en=1;
				#50;
				en=0;
				#400	$finish();
		end
endmodule