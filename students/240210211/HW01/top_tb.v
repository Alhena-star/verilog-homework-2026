module test16;
	wire clk;
	clk_gen u_clk(clk);
	reg en;
	reg clr;
	wire[9:0] q;
	CD4017 u_cd4017(clk,en,clr,q);
	initial
	begin
		$dumpfile("done");
		$dumpvars();
		clr=1;
		en=1;
		#20 clr=0;
		#300 en=1;
		#100 en=0;
		#200 clr=1;
		#50 $finish();
	end
endmodule