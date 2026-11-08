module top_tb;
	wire clk;
	reg en;
	reg clr;
	wire [9:0] q;
	clk_gen u_clk(.clk(clk));
	cd4017 u_cd4017(.clk(clk),.en(en),.clr(clr),.q(q));
	initial begin
	$dumpfile("wave.vcd");	
	$dumpvars(0,top_tb);
	en=0; clr=1;
	#20 clr=0;
	#200 en=1;
	#100 en=0;
	#200 clr=1;
	#20 $finish;
end
endmodule
