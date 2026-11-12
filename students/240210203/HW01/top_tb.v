module top_tb;
wire clk;
reg en;
reg clr;
wire [9:0] q;
clk_gen u_clk(clk);
CD4017 u_cd4017(clk, en, clr, q);
initial
begin
	$dumpfile("wave.vcd");
	$dumpvars;
	en = 1;
	clr = 1;
	#20 clr = 0;
	#300 en = 0;
	#100 $finish();
end
endmodule